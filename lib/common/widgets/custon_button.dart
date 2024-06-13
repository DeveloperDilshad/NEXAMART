import 'package:flutter/material.dart';
import 'package:nexamart/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: GlobalVariables.secondaryColor),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
