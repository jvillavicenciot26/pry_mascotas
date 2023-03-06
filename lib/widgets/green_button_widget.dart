import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

class GreenButtonWiget extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  GreenButtonWiget({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: cHeight * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: cGreenColor,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: cGreyColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
