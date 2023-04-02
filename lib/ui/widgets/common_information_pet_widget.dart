import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/constants.dart';

class CommonInformationPetWidget extends StatelessWidget {
  String title;
  String data;
  Color color;

  CommonInformationPetWidget({
    required this.title,
    required this.data,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.25),
        borderRadius: BorderRadius.circular(lCircularBorder),
      ),
      child: Column(
        children: [
          H4(
            text: title,
            color: color,
            fontWeight: FontWeight.bold,
          ),
          spacing16,
          H5(
            text: data,
            color: color,
          ),
        ],
      ),
    );
  }
}
