import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/widgets/green_button_widget.dart';
import 'package:pry_mascotas/widgets/white_button_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cBlueColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: cWidth * 0.2,
                  height: cWidth * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/logo.png",
                      ),
                    ),
                  ),
                ),
                Text(
                  "Misión \nPatitas",
                  style: TextStyle(
                    color: cWhiteColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: cHeight * 0.40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: cWhiteColor.withOpacity(0.6),
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextField(
                          cursorColor: cBlueColor,
                          decoration: InputDecoration(
                            hintText: "Usuario",
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: cWhiteColor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26.0),
                              borderSide: BorderSide(
                                color: cBlueColor,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26.0),
                              borderSide: BorderSide(
                                color: cBlueColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          cursorColor: cBlueColor,
                          decoration: InputDecoration(
                            hintText: "Clave",
                            prefixIcon: Icon(Icons.key),
                            filled: true,
                            fillColor: cWhiteColor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26.0),
                              borderSide: BorderSide(
                                color: cBlueColor,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26.0),
                              borderSide: BorderSide(
                                color: cBlueColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        GreenButtonWiget(
                          label: "INICIAR SESIÓN",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => LoginPage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: cGreyColor,
                                thickness: 2,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ),
                            Text(
                              "o puedes conectar con",
                              style: TextStyle(
                                color: cGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: cGreyColor,
                                thickness: 2,
                                indent: 10,
                                endIndent: 10,
                              ),
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
                              width: cWidth * 0.15,
                              height: cWidth * 0.15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/facebook.png",
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: cWidth * 0.15,
                              height: cWidth * 0.15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/google.png",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: cHeight * 0.35,
                    child: Container(
                      width: cWidth * 0.92,
                      height: cHeight * 0.35,
                      decoration: BoxDecoration(
                        //color: Colors.amber,
                        image: DecorationImage(
                          image: AssetImage("assets/images/img_login.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
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
