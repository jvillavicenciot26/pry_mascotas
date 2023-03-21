import 'package:flutter/material.dart';
import 'package:pry_mascotas/pages/specific_pet_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

class ItemAllPetLostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
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
          color: cWhiteColor,
          borderRadius: BorderRadius.circular(lCircularBorder),
          boxShadow: [
            BoxShadow(
              color: cGreyColor.withOpacity(0.2),
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
                  height: cHeight * 0.22,
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
                  color: cGreenColor.withOpacity(0.7),
                  child: const Text(
                    "3 años",
                    style: TextStyle(
                      color: cGreyColor,
                      fontSize: 18.0,
                    ),
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
                        children: const [
                          Text(
                            "Bobby",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.male,
                        size: 30.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "Esto es una prueba de descripcion que podria tener errores. Por eso estamos trabajando.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "4 días",
                    style: TextStyle(
                      color: cRedColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
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
