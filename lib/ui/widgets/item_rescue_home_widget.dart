import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/pages/specific_pet_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class ItemRescueHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecificPet(origin: "R"),
          ),
        );
      },
      child: Container(
        height: ResponsiveUI.pHeight(context, 0.2), //cHeight * 0.2,
        width: double.infinity,
        margin: const EdgeInsets.only(
          bottom: 15.0,
        ),
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: ResponsiveUI.pHeight(context, 0.2), //cHeight * 0.2,
              width:
                  ResponsiveUI.pWidth(context, 0.38), //cWidth * 0.38, //0.48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/255387/pexels-photo-255387.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: BrandColor.cWhiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(lCircularBorder),
                    bottomRight: Radius.circular(lCircularBorder),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: BrandColor.cGreyColor.withOpacity(0.2),
                      offset: const Offset(3, 3),
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          H5(
                            text: "Especie: ",
                            color: BrandColor.cBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          H5(
                            text: "Conejo: ",
                            color: BrandColor.cGreyColor,
                          ),
                        ],
                      ),
                      spacing8,
                      Row(
                        children: [
                          H5(
                            text: "Condicion: ",
                            color: BrandColor.cBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          H5(
                            text: "Conejo: ",
                            color: BrandColor.cGreyColor,
                          ),
                        ],
                      ),
                      spacing16,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.message_outlined,
                            color: BrandColor.cGreyColor,
                          ),
                          Icon(
                            Icons.female,
                            color: BrandColor.cGreyColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
