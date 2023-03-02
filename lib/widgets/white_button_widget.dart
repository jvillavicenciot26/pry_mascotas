import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

class WhiteButtonWidget extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  WhiteButtonWidget({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: cHeight * 0.05,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(
            color: cBlueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: cWhiteColor,
          side: BorderSide(
            color: cBlueColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
