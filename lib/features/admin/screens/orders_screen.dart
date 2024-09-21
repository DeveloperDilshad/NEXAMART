import 'package:flutter/material.dart';
import 'package:nexamart/common/widgets/loader.dart';
import 'package:nexamart/features/account/widgets/single_product.dart';
import 'package:nexamart/features/admin/services/admin_service.dart';
import 'package:nexamart/features/order_details/order_details_screen.dart';
import 'package:nexamart/models/order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final AdminServices adminServices = AdminServices();
  List<Order>? orders;

  @override
  void initState() {
    getAllOrders();
    super.initState();
  }

  void getAllOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: GridView.builder(
              itemCount: orders!.length,
              itemBuilder: (context, index) {
                final orderData = orders![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrderDetailsScreen.routeName,
                        arguments: orderData);
                  },
                  child: SizedBox(
                    height: 140,
                    child: SingleProduct(
                      // Ensure the product index is valid
                      image: orderData.products.isNotEmpty
                          ? orderData.products[0].images[0]
                          : 'placeholder_image_url', // provide a placeholder image URL if there are no products
                    ),
                  ),
                );
              },
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            ),
          );
  }
}
