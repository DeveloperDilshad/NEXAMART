import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nexamart/constants/error_handling.dart';
import 'package:nexamart/constants/global_variables.dart';
import 'package:nexamart/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:nexamart/models/user.dart';
import 'package:nexamart/provider/user_provider.dart';
import 'package:provider/provider.dart';

class AddressServices {
  void saveUserAdress({
    required BuildContext context,
    required String address,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res =
          await http.post(Uri.parse('$uri/api/save-user-address'),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'x-auth-token': userProvider.user.token,
              },
              body: jsonEncode({
                'address': address,
              }));

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            User user = userProvider.user.copyWith(
              address: jsonDecode(res.body)['address'],
            );
            userProvider.setUserFromModel(user);
          });
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
      );
      print('error is here');
    }
  }

  void placeOrder({
    required BuildContext context,
    required String address,
    required double totalSum,
  }) async {
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );

    try {
      http.Response res = await http.post(Uri.parse('$uri/api/order'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode({
            'cart': userProvider.user.cart,
            'address': address,
            'totalPrice': totalSum,
          }));
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(context, 'Order has been placed');
            User user = userProvider.user.copyWith(cart: []);
            userProvider.setUserFromModel(user);
          });
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
      );
      print(e);
    }
  }
}
