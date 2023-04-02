import 'package:flutter/material.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class CommonCircularButtonWidget extends StatelessWidget {
  Color color;
  IconData icon;
  double fHeight;
  VoidCallback onTap;

  CommonCircularButtonWidget({
    required this.color,
    required this.icon,
    required this.fHeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: CircleAvatar(
        backgroundColor: color.withOpacity(0.25),
        radius: ResponsiveUI.pHeight(context, fHeight),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
