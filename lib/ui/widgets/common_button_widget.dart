import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';

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
    return SizedBox(
      width: double.infinity,
      height: ResponsiveUI.pHeight(context, 0.05), //cHeight * 0.05,
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
                  H4(
                    text: label,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ]
              : origin == "A" || origin == "R"
                  ? [
                      H4(
                        text: label,
                        color: BrandColor.cWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                      spacing10Width,
                      Image.asset(
                        origin == "A"
                            ? AssetData.imageHuellaSelected
                            : AssetData.imageSalud,
                        height: ResponsiveUI.pHeight(
                          context,
                          0.03,
                        ), //cHeight * 0.03,
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
