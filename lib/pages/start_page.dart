import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pry_mascotas/pages/login_page.dart';
import 'package:pry_mascotas/pages/signup_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/widgets/common_button_widget.dart';

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
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/logo.png",
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Misión \nPatitas",
                        style: TextStyle(
                          color: cWhiteColor,
                          fontSize: 35.0,
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
                        decoration: const BoxDecoration(
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
                          CommonButtonWiget(
                            label: "INICIAR SESIÓN",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginPage(),
                                ),
                              );
                            },
                            backColor: cGreenColor,
                            textColor: cBlackColor,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CommonButtonWiget(
                            label: "REGISTRATE",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpPage(),
                                ),
                              );
                            },
                            backColor: cWhiteColor,
                            textColor: cBlueColor,
                            withBorder: true,
                            borderColor: cBlueColor,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: cHeight * 0.135,
                      child: Container(
                        width: cWidth * 0.92,
                        height: cHeight * 0.35,
                        decoration: const BoxDecoration(
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
