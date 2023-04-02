import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/pages/login_page.dart';
import 'package:pry_mascotas/ui/pages/signup_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_button_widget.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        width: ResponsiveUI.pWidth(context, 0.2),
                        height: ResponsiveUI.pWidth(context, 0.2),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AssetData.imageLogo,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Misión \nPatitas",
                        style: TextStyle(
                          color: BrandColor.cWhiteColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: ResponsiveUI.pWidth(context, 0.7),
                    child: Transform.rotate(
                      angle: pi / -5,
                      child: Container(
                        width: ResponsiveUI.pWidth(context, 0.35),
                        height: ResponsiveUI.pHeight(
                            context, 0.25), //cHeight * 0.25,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetData.imageHuellas),
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
                height: ResponsiveUI.pHeight(context, 0.2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(lCircularBorder),
                  color: BrandColor.cWhiteColor.withOpacity(0.6),
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
                            backColor: BrandColor.cGreenColor,
                            textColor: BrandColor.cBlackColor,
                          ),
                          spacing10,
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
                            backColor: BrandColor.cWhiteColor,
                            textColor: BrandColor.cBlueColor,
                            withBorder: true,
                            borderColor: BrandColor.cBlueColor,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: ResponsiveUI.pHeight(context, 0.135),
                      child: Container(
                        width: ResponsiveUI.pWidth(context, 0.92),
                        height: ResponsiveUI.pHeight(context, 0.35),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetData.imageImgStart),
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
