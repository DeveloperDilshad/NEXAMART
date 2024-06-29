import 'package:flutter/material.dart';
import 'package:nexamart/constants/global_variables.dart';
import 'package:nexamart/features/home/screens/category_deals_screen.dart';

class TopCatagories extends StatefulWidget {
  const TopCatagories({super.key});

  @override
  State<TopCatagories> createState() => _TopCatagoriesState();
}

class _TopCatagoriesState extends State<TopCatagories> {
  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToCategoryPage(
                context, GlobalVariables.categoryImages[index]['title']!),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w200),
                ),
              ],
            ),
          );
        },
        itemCount: GlobalVariables.categoryImages.length,
      ),
    );
  }
}
