import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/pages/home_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';
import 'package:pry_mascotas/utils/types.dart';
import 'package:pry_mascotas/ui/widgets/connect_social_widget.dart';
import 'package:pry_mascotas/ui/widgets/common_button_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_common_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_password_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.cBlueColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: ResponsiveUI.pHeight(context, 1) - appBarHeight - 20 - 16,
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
              const Expanded(child: SizedBox()),
              Container(
                width: double.infinity,
                //height: cHeight * 0.40,
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
                          TextFieldCommonWidget(
                            hintText: "Usuario",
                            icon: const Icon(
                              Icons.person,
                              color: BrandColor.cGreyColor,
                            ),
                            type: InputType.text,
                          ),
                          spacing10,
                          TextFielPasswordWidget(),
                          spacing10,
                          CommonButtonWiget(
                            label: "INICIAR SESIÓN",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => HomePage(),
                                ),
                              );
                            },
                            backColor: BrandColor.cGreenColor,
                            textColor: BrandColor.cBlackColor,
                          ),
                          spacing10,
                          ConnectSocialWidet(),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: ResponsiveUI.pHeight(context, 0.31),
                      child: Container(
                        width: ResponsiveUI.pWidth(context, 0.92),
                        height: ResponsiveUI.pHeight(context, 0.35),
                        decoration: const BoxDecoration(
                          //color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage(AssetData.imageImgLogin),
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
