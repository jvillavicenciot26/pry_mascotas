import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

class CommonButtonWiget extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  Color backColor;
  Color textColor;
  bool? withBorder;
  Color? borderColor;
  String? origin;

  CommonButtonWiget({
    required this.label,
    required this.onPressed,
    required this.backColor,
    required this.textColor,
    this.withBorder = false,
    this.borderColor,
    this.origin,
  });

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: cHeight * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(lCircularBorder),
          ),
          side: withBorder!
              ? BorderSide(
                  color: borderColor!,
                  width: 2.0,
                )
              : BorderSide.none,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: origin == null
              ? [
                  Text(
                    label,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ]
              : origin == "A" || origin == "R"
                  ? [
                      Text(
                        label,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: cWidth * 0.03,
                      ),
                      Image.asset(
                        origin == "A"
                            ? "assets/images/huella_selected.png"
                            : "assets/images/salud.png",
                        height: cHeight * 0.03,
                      ),
                    ]
                  : [
                      const SizedBox(),
                    ],
        ),
      ),
    );
  }
}
