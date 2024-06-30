import 'package:flutter/material.dart';
import 'package:nexamart/models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  fit: BoxFit.fitHeight,
                  height: 135,
                  width: 135,
                ),
                Column(
                  children: [
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }
}
