import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

class WhiteButtonWidget extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  WhiteButtonWidget({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: cHeight * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: cWhiteColor,
          side: const BorderSide(
            color: cBlueColor,
            width: 2.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(lCircularBorder),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: cBlueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
