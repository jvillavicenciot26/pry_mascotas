import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';

class RowOptionsHomeWidget extends StatelessWidget {
  String section;
  VoidCallback onTap;
  String? option;

  RowOptionsHomeWidget({
    required this.section,
    required this.onTap,
    this.option = "Ver Todo",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          section,
          style: const TextStyle(
            color: BrandColor.cBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 4.0,
            ),
            decoration: BoxDecoration(
              color: BrandColor.cBlueColor.withOpacity(0.35),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                H5(
                  text: option!,
                  color: BrandColor.cBlueColor,
                ),
                const Icon(
                  Icons.arrow_right,
                  color: BrandColor.cBlueColor,
                  size: 16.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
