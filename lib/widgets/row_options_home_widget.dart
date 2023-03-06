import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

class RowOptionsHomeWidget extends StatelessWidget {
  String section;
  VoidCallback onTap;

  RowOptionsHomeWidget({required this.section, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          section,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: const Text(
            "Ver todo",
            style: TextStyle(
              color: cGreyColor,
            ),
          ),
        ),
      ],
    );
  }
}
