import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nexamart/features/admin/models/sales.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<Sales> earnings;
  const CategoryProductsChart({super.key, required this.earnings});

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> pieChartSections = earnings.map((sales) {
      return PieChartSectionData(
        value: sales.earning.toDouble(),
        title: sales.label,
        color: _getCategoryColor(sales.label),
        radius: 100,
        titleStyle: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      );
    }).toList();

    return PieChart(
      PieChartData(
        sections: pieChartSections,
        centerSpaceRadius: 40,
        sectionsSpace: 2,
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Mobiles':
        return Colors.blue;
      case 'Essentials':
        return Colors.green;
      case 'Appliances':
        return Colors.orange;
      case 'Books':
        return Colors.red;
      case 'Fashion':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
