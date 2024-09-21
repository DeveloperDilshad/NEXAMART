import 'package:flutter/material.dart';
import 'package:nexamart/common/widgets/loader.dart';
import 'package:nexamart/features/admin/models/sales.dart';
import 'package:nexamart/features/admin/services/admin_service.dart';
import 'package:nexamart/features/admin/widgets/category_products_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSale;
  List<Sales>? earnings;
  @override
  void initState() {
    getEarnings();
    super.initState();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSale = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSale == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '\$$totalSale',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                  height: 250,
                  child: CategoryProductsChart(earnings: earnings!))
            ],
          );
  }
}
