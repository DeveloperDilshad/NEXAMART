import 'package:flutter/material.dart';
import 'package:nexamart/common/widgets/loader.dart';
import 'package:nexamart/features/account/widgets/single_product.dart';
import 'package:nexamart/features/admin/screens/add_product_screen.dart';
import 'package:nexamart/features/admin/services/admin_service.dart';
import 'package:nexamart/models/product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products = [];
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              productData.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          IconButton(
                            onPressed: () => deleteProduct(productData, index),
                            icon: const Icon(
                              Icons.delete_outline,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddProduct,
              tooltip: 'Add a Product',
              child: const Icon(
                Icons.add,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
