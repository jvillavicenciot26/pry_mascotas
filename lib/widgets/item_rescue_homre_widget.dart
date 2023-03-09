import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

class ItemRescueHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return Container(
      height: cHeight * 0.2,
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 15.0,
      ),
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: cHeight * 0.2,
            width: cWidth * 0.38, //0.48,
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
                color: cWhiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(26.0),
                  bottomRight: Radius.circular(26.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: cGreyColor.withOpacity(0.2),
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
                        const Text(
                          "Especie:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Conejo",
                          style: const TextStyle(
                            color: cGreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Condicion:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Conejo",
                          style: const TextStyle(
                            color: cGreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.message_outlined,
                          color: cGreyColor,
                        ),
                        Icon(
                          Icons.female,
                          color: cGreyColor,
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
    );
  }
}
