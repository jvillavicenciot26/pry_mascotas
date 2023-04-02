import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/pages/detail_event_page.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/ui/widgets/common_button_widget.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class ItemEventHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: cHeight * 0.35,
      width: double.infinity,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: BrandColor.cWhiteColor,
        borderRadius: BorderRadius.circular(lCircularBorder),
        boxShadow: [
          BoxShadow(
            color: BrandColor.cGreyColor.withOpacity(0.2),
            offset: const Offset(3, 3),
            blurRadius: 5.0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: ResponsiveUI.pHeight(context, 0.21), //cHeight * 0.21,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(lCircularBorder),
                topRight: Radius.circular(lCircularBorder),
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://peru21.pe/resizer/0INjZlyXxgkcggIv4kn4CfCaZkE=/980x0/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/A7OFXK4Y25E5VEUKEYEYVGF2N4.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H5(
                  text: "jue, 23 feb 2023",
                  color: BrandColor.cGreyColor,
                ),
                spacing6,
                H3(
                  text: "Mascoting - Barcelona",
                  color: BrandColor.cBlackColor,
                  fontWeight: FontWeight.bold,
                ),
                spacing10,
                Row(
                  children: [
                    Expanded(
                      child: CommonButtonWiget(
                        label: "Detalles",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailEventPage(),
                            ),
                          );
                        },
                        backColor: BrandColor.cWhiteColor,
                        textColor: BrandColor.cBlueColor,
                        withBorder: true,
                        borderColor: BrandColor.cBlueColor,
                      ),
                    ),
                    spacing20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        H5(
                          text: "Trujillo - Peru",
                          color: BrandColor.cGreyColor,
                        ),
                        const Icon(
                          Icons.location_on,
                          color: BrandColor.cGreyColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
