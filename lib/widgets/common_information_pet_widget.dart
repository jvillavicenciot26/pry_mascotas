import 'package:flutter/material.dart';
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
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            data,
            style: TextStyle(
              color: color,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
