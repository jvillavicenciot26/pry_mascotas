import 'package:flutter/material.dart';

class CommonCircularButtonWidget extends StatelessWidget {
  Color color;
  IconData icon;
  double fHeight;
  VoidCallback onTap;

  CommonCircularButtonWidget(
      {required this.color,
      required this.icon,
      required this.fHeight,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: CircleAvatar(
        backgroundColor: color.withOpacity(0.25),
        radius: cHeight * fHeight,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
