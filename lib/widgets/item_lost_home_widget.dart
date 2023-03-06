import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

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
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      width: cWidth * 0.32,
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
          Container(
            height: cHeight * 0.15,
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
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Edad: $age años",
                          style: const TextStyle(
                            color: cGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
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
                Text(
                  "$days días",
                  style: const TextStyle(
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
    );
  }
}
