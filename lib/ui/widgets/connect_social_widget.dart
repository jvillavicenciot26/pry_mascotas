import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class ConnectSocialWidet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: BrandColor.cGreyColor,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
            ),
            H4(
              text: "o puedes conectar con",
              color: BrandColor.cGreyColor,
              fontWeight: FontWeight.bold,
            ),
            const Expanded(
              child: Divider(
                color: BrandColor.cGreyColor,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
            ),
          ],
        ),
        spacing10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: ResponsiveUI.pWidth(context, 0.15), //cWidth * 0.15,
              height: ResponsiveUI.pWidth(context, 0.15), //cWidth * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssetData.imagFacebook,
                  ),
                ),
              ),
            ),
            Container(
              width: ResponsiveUI.pWidth(context, 0.15), //cWidth * 0.15,
              height: ResponsiveUI.pWidth(context, 0.15), //cWidth * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssetData.imageGoogle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
