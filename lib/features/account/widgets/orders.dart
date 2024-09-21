import 'package:flutter/material.dart';
import 'package:nexamart/common/widgets/loader.dart';
import 'package:nexamart/constants/global_variables.dart';
import 'package:nexamart/features/account/services/account_services.dart';
import 'package:nexamart/features/account/widgets/single_product.dart';
import 'package:nexamart/features/order_details/order_details_screen.dart';
import 'package:nexamart/models/order.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final AccountServices accountServices = AccountServices();
  List<Order>? orders;

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : orders!.isEmpty
            ? const Center(
                child: Text(
                  'No orders found',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: const Text(
                          'Your Orders',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 15,
                        ),
                        child: Text(
                          'See all',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: GlobalVariables.selectedNavBarColor),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 170,
                    padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: orders!.length,
                      itemBuilder: (context, index) {
                        if (orders![index].products.isNotEmpty) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                OrderDetailsScreen.routeName,
                                arguments: orders![index],
                              );
                            },
                            child: SingleProduct(
                              image: orders![index].products[0].images[0],
                            ),
                          );
                        } else {
                          return const SizedBox
                              .shrink(); // Skip orders with no products
                        }
                      },
                    ),
                  )
                ],
              );
  }
}
