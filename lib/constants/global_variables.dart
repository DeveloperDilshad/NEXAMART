import 'package:flutter/material.dart';

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromRGBO(202, 208, 86, 1),
      Color.fromRGBO(202, 206, 151, 1),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(202, 208, 86, 1);
  static const backgroundColor = Colors.white;
  static const greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}
