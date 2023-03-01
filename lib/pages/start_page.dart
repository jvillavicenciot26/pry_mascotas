import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    //double pyth = sqrt(pow(cHeight, 2) + pow(cWidth, 2));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
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
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: cWidth * 0.7,
                    child: Transform.rotate(
                      angle: pi / -5,
                      child: Container(
                        width: cWidth * 0.35,
                        height: cHeight * 0.25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/huellas.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: cHeight * 0.2,
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
                          SizedBox(
                            width: double.infinity,
                            height: cHeight * 0.05,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "INICIAR SESION",
                                style: TextStyle(
                                  color: cGreyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cGreenColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: cHeight * 0.05,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "REGISTRATE",
                                style: TextStyle(
                                  color: cBlueColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cWhiteColor,
                                side: BorderSide(
                                  color: cBlueColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: cHeight * 0.135,
                      child: Container(
                        width: cWidth * 0.92,
                        height: cHeight * 0.35,
                        decoration: BoxDecoration(
                          //color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage("assets/images/img_start.png"),
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
      ),
    );
  }
}
