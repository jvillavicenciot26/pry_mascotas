import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pry_mascotas/bloc/login/login_bloc.dart';
import 'package:pry_mascotas/bloc/login/login_event.dart';
import 'package:pry_mascotas/bloc/login/login_state.dart';
import 'package:pry_mascotas/services/remote/firestore_service.dart';
import 'package:pry_mascotas/ui/pages/home_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';
import 'package:pry_mascotas/utils/types.dart';
import 'package:pry_mascotas/ui/widgets/common_button_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_common_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_password_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKeyLogin = GlobalKey<FormState>();
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.cBlueColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                          child: Form(
                            key: formKeyLogin,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextFieldCommonWidget(
                                  controller: emailController,
                                  hintText: "Usuario",
                                  icon: const Icon(
                                    Icons.person,
                                    color: BrandColor.cGreyColor,
                                  ),
                                  type: InputType.text,
                                ),
                                spacing16,
                                TextFielPasswordWidget(
                                  controller: passwordController,
                                ),
                                spacing16,
                                CommonButtonWiget(
                                  label: "INICIAR SESIÓN",
                                  onPressed: () {
                                    //login();
                                    if (formKeyLogin.currentState!.validate()) {
                                      BlocProvider.of<LoginBloc>(context).add(
                                        LoginCredentialEvent(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                    }
                                  },
                                  backColor: BrandColor.cGreenColor,
                                  textColor: BrandColor.cBlackColor,
                                ),
                                spacing10,
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        const Expanded(
                                          child: Divider(
                                            color: BrandColor.cGreyColor,
                                            thickness: 2,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                        ),
                                        H4(
                                          text: "o puedes conectar con",
                                          color: BrandColor.cGreyColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const Expanded(
                                          child: Divider(
                                            color: BrandColor.cGreyColor,
                                            thickness: 2,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    spacing10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: ResponsiveUI.pWidth(
                                              context, 0.15),
                                          height: ResponsiveUI.pWidth(
                                              context, 0.15),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              BlocProvider.of<LoginBloc>(
                                                      context)
                                                  .add(LoginFacebookEvent());
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              shadowColor: Colors.transparent,
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                            child: Image.asset(
                                              AssetData.imagFacebook,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: ResponsiveUI.pWidth(
                                              context, 0.15),
                                          height: ResponsiveUI.pWidth(
                                              context, 0.15),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              BlocProvider.of<LoginBloc>(
                                                      context)
                                                  .add(LoginGoogleEvent());
                                            }, //loginWithGoogle,
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              shadowColor: Colors.transparent,
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                            child: Image.asset(
                                              AssetData.imageGoogle,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: ResponsiveUI.pHeight(context, 0.325),
                          child: Container(
                            width: ResponsiveUI.pWidth(context, 0.92),
                            height: ResponsiveUI.pHeight(context, 0.35),
                            decoration: const BoxDecoration(
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
          BlocListener(
            bloc: BlocProvider.of<LoginBloc>(context),
            listener: (BuildContext context, LoginState state) {
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  snackBarError(state.errorMessage),
                );
              } else if (state is LoginSuccedState) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ),
                    (route) => false);
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (BuildContext context, LoginState state) {
                if (state is LoginInitState) {
                  return const SizedBox();
                } else if (state is LoginLoadingState) {
                  return Container(
                    color: BrandColor.cWhiteColor.withOpacity(0.70),
                    child: loadingWidget,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          // isLoading
          //     ? Container(
          //         color: Colors.white70,
          //         child: loadingWidget,
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }
}
