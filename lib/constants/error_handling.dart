import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:nexamart/constants/utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(response.body)['msg']);
      print('1');
      break;
    case 500:
      showSnackbar(context, jsonDecode(response.body)['error']);
      print('2');
      break;
    default:
      showSnackbar(context, response.body);
  }
}
