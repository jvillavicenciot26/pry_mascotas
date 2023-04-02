import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/pages/specific_pet_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class ItemLostHomeWidget extends StatelessWidget {
  String name;
  double age;
  int days;

  ItemLostHomeWidget({
    required this.name,
    required this.age,
    required this.days,
  });

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
        margin: const EdgeInsets.only(right: 15.0, bottom: 10.0),
        width: ResponsiveUI.pWidth(context, 0.32), //cWidth * 0.32,
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
            Container(
              height: ResponsiveUI.pHeight(context, 0.15), //cHeight * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(lCircularBorder),
                  topLeft: Radius.circular(lCircularBorder),
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/13688472/pexels-photo-13688472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          H3(
                            text: name,
                            color: BrandColor.cBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          spacing4,
                          H5(
                            text: "Edad: $age años",
                            color: BrandColor.cGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.male,
                        size: 30.0,
                      ),
                    ],
                  ),
                  spacing4,
                  H4(
                    text: "$days días",
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
