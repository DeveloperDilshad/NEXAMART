import 'package:flutter/material.dart';
import 'package:nexamart/constants/global_variables.dart';

class PageViewImage extends StatefulWidget {
  const PageViewImage({super.key});

  @override
  _PageViewImageState createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Auto-scrolling (optional, change duration as needed)
    Future.delayed(Duration(seconds: 3), _autoScroll);
  }

  // Auto-scrolling function
  void _autoScroll() {
    if (_controller.hasClients) {
      _controller.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      Future.delayed(const Duration(seconds: 3), _autoScroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200, // Height of the carousel
          child: PageView.builder(
            controller: _controller,
            itemCount: GlobalVariables.carouselImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                GlobalVariables.carouselImages[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: GlobalVariables.carouselImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.jumpToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? Colors.blue
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
