import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/pages/specific_pet_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class ItemAdoptionHomeWidget extends StatelessWidget {
  String name;
  double age;
  String description;

  ItemAdoptionHomeWidget({
    required this.name,
    required this.age,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecificPet(origin: "A"),
          ),
        );
      },
      child: Container(
        width: ResponsiveUI.pWidth(context, 0.82), //cWidth * 0.82,
        margin: const EdgeInsets.only(right: 15.0, bottom: 10.0),
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
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: ResponsiveUI.pHeight(context, 0.2), //cHeight * 0.2,
              width: ResponsiveUI.pWidth(context, 0.45), //cWidth * 0.45
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(lCircularBorder),
                  bottomLeft: Radius.circular(lCircularBorder),
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/14594704/pexels-photo-14594704.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        H5(
                          text: "Soy:",
                          color: BrandColor.cBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        H5(
                          text: name,
                          color: BrandColor.cGreyColor,
                        ),
                      ],
                    ),
                    spacing4,
                    Row(
                      children: [
                        H5(
                          text: "Tengo:",
                          color: BrandColor.cBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        H5(
                          text: "$age años",
                          color: BrandColor.cGreyColor,
                        ),
                      ],
                    ),
                    spacing10,
                    SizedBox(
                      width:
                          ResponsiveUI.pWidth(context, 0.3), ////cWidth * 0.3,
                      child: H5(
                        text: description,
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        color: BrandColor.cGreyColor,
                      ),
                    ),
                    spacing10,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.female,
                          color: BrandColor.cGreyColor,
                        ),
                        Icon(
                          Icons.message_outlined,
                          color: BrandColor.cGreyColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
