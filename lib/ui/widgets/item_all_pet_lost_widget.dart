import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/pages/specific_pet_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class ItemAllPetLostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecificPet(origin: "L"),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: BrandColor.cWhiteColor,
          borderRadius: BorderRadius.circular(lCircularBorder),
          boxShadow: [
            BoxShadow(
              color: BrandColor.cGreyColor.withOpacity(0.2),
              offset: const Offset(3, 3),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: ResponsiveUI.pHeight(context, 0.22), //cHeight * 0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(lCircularBorder),
                      topLeft: Radius.circular(lCircularBorder),
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://images.pexels.com/photos/13688472/pexels-photo-13688472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: BrandColor.cGreenColor.withOpacity(0.7),
                  child: H4(
                    text: "3 años",
                    color: BrandColor.cGreyColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          H3(
                            text: "Bobby",
                            color: BrandColor.cBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          spacing4,
                        ],
                      ),
                      const Icon(
                        Icons.male,
                        size: 30.0,
                      ),
                    ],
                  ),
                  spacing4,
                  H5(
                    text:
                        "Esto es una prueba de descripcion que podria tener errores. Por eso estamos trabajando.",
                    fontWeight: FontWeight.w300,
                    maxLines: 3,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  spacing6,
                  H4(
                    text: "4 días",
                    color: BrandColor.cRedColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
