import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pry_mascotas/pages/home_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/types.dart';
import 'package:pry_mascotas/widgets/connect_social_widget.dart';
import 'package:pry_mascotas/widgets/common_button_widget.dart';
import 'package:pry_mascotas/widgets/textfield_common_widget.dart';
import 'package:pry_mascotas/widgets/textfield_password_widget.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cBlueColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: cHeight - appBarHeight - 20 - 16,
          child: Column(
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
              Expanded(child: SizedBox()),
              Container(
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
                          TextFieldCommonWidget(
                            hintText: "Nombres",
                            icon: const Icon(
                              Icons.person,
                              color: cGreyColor,
                            ),
                            type: InputType.text,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFieldCommonWidget(
                            hintText: "Apellidos",
                            icon: const Icon(
                              Icons.person,
                              color: cGreyColor,
                            ),
                            type: InputType.text,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFieldCommonWidget(
                            hintText: "Usuario",
                            icon: const Icon(
                              Icons.person,
                              color: cGreyColor,
                            ),
                            type: InputType.text,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFielPasswordWidget(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CommonButtonWiget(
                            label: "CREAR CUENTA",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => HomePage(),
                                ),
                              );
                            },
                            backColor: cGreenColor,
                            textColor: cBlackColor,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ConnectSocialWidet(),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: cHeight * 0.437,
                      child: Container(
                        width: cWidth * 0.92,
                        height: cHeight * 0.30,
                        decoration: const BoxDecoration(
                          //color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage("assets/images/img_signup.png"),
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
