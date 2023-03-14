import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/widgets/green_button_widget.dart';

class SpecificPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: cWhiteColor.withOpacity(0.25),
            child: BackButton(
              color: cWhiteColor,
            ),
          ),
        ), //
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: cHeight * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(lCircularBorder),
                bottomRight: Radius.circular(lCircularBorder),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/13688472/pexels-photo-13688472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tobby",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                            ),
                            Text(
                              "Trujillo - Perú",
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "20/12/2022",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: cBlueColor.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(lCircularBorder),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Genero",
                            style: TextStyle(
                              color: cBlueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            "Macho",
                            style: TextStyle(
                              color: cBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: cGreenColor.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(lCircularBorder),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Genero",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            "Macho",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: cRedColor.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(lCircularBorder),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Genero",
                            style: TextStyle(
                              color: cRedColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            "Macho",
                            style: TextStyle(
                              color: cRedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: cHeight * 0.03,
                          backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/13688472/pexels-photo-13688472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nombre de persona",
                            ),
                            Text(
                              "Dueño",
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: cGreenColor.withOpacity(0.25),
                          radius: cHeight * 0.03,
                          child: Icon(
                            Icons.message_outlined,
                            color: cGreenColor,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: cBlueColor.withOpacity(0.25),
                          radius: cHeight * 0.03,
                          child: Icon(
                            Icons.location_on_outlined,
                            color: cBlueColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Encontrado",
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cBlueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(lCircularBorder),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Visto",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cGreenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(lCircularBorder),
                          ),
                        ),
                      ),
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
