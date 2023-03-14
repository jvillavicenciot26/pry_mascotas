import 'package:flutter/material.dart';
import 'package:pry_mascotas/pages/specific_pet_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

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
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecificPet(),
          ),
        );
      },
      child: Container(
        width: cWidth * 0.82,
        margin: const EdgeInsets.only(right: 15.0, bottom: 10.0),
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
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: cHeight * 0.2,
              width: cWidth * 0.45, //0.48,
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
                        const Text(
                          "Soy:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                            color: cGreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Tengo:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "$age años",
                          style: const TextStyle(
                            color: cGreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: cWidth * 0.3,
                      child: Text(
                        description,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: cGreyColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.female,
                          color: cGreyColor,
                        ),
                        Icon(
                          Icons.message_outlined,
                          color: cGreyColor,
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
