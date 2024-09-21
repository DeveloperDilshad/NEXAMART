import 'package:flutter/material.dart';

String uri = 'https://nexamart-server.onrender.com';

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromRGBO(202, 208, 86, 1),
      Color.fromRGBO(177, 187, 42, 1),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(202, 208, 86, 1);
  static const backgroundColor = Colors.white;
  static const greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color.fromRGBO(202, 208, 86, 1);
  static const unselectedNavBarColor = Colors.black87;

  static const List<String> carouselImages = [
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.png',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.png',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.png',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.png',
    },
  ];
}
