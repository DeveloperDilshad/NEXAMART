import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nexamart/constants/error_handling.dart';
import 'package:nexamart/constants/global_variables.dart';
import 'package:nexamart/constants/utils.dart';
import 'package:nexamart/models/product.dart';
import 'package:nexamart/provider/user_provider.dart';
import 'package:provider/provider.dart';

class SearchServices {
  Future<List<Product>> fetchSearchedProducts(
      {required BuildContext context, required String searchQuery}) async {
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    List<Product> productList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/products/search/$searchQuery'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                Product.fromJson(
                  jsonEncode(
                    jsonDecode(
                      res.body,
                    )[i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
      );
      print(e);
    }
    return productList;
  }
}
