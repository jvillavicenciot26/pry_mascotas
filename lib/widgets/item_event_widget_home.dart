import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/widgets/white_button_widget.dart';

class ItemEventHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return Container(
      //height: cHeight * 0.35,
      width: double.infinity,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cWhiteColor,
        borderRadius: BorderRadius.circular(lCircularBorder),
        boxShadow: [
          BoxShadow(
            color: cGreyColor.withOpacity(0.2),
            offset: const Offset(3, 3),
            blurRadius: 5.0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: cHeight * 0.21,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(lCircularBorder),
                topRight: Radius.circular(lCircularBorder),
              ),
              image: DecorationImage(
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
                Text(
                  "jue, 23 feb 2023",
                  style: TextStyle(
                    color: cGreyColor,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  "Mascoting - Barcelona",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: WhiteButtonWidget(
                        label: "Detalles",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Trujillo - Peru",
                          style: TextStyle(
                            color: cGreyColor,
                          ),
                        ),
                        Icon(
                          Icons.location_on,
                          color: cGreyColor,
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
