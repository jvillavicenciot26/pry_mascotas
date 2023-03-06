import 'package:flutter/material.dart';
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
    return Container(
      //height: cHeight * 0.2,
      //width: cWidth * 0.25,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: cHeight * 0.2,
            width: cWidth * 0.48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(lCircularBorder),
                bottomLeft: Radius.circular(lCircularBorder),
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/255387/pexels-photo-255387.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.female),
                    Icon(Icons.message_outlined),
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
