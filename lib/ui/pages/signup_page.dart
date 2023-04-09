import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pry_mascotas/models/user_model.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';
import 'package:pry_mascotas/services/remote/firestore_service.dart';
import 'package:pry_mascotas/ui/pages/home_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';
import 'package:pry_mascotas/utils/types.dart';
import 'package:pry_mascotas/ui/widgets/common_button_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_common_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_password_widget.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nombresController = TextEditingController();
  TextEditingController apePaternoController = TextEditingController();
  TextEditingController apeMaternoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  final formKeyRegister = GlobalKey<FormState>();

  registerUser() async {
    try {
      if (formKeyRegister.currentState!.validate()) {
        isLoading = true;
        setState(() {});
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (userCredential.user != null) {
          FirestoreService firestoreService = FirestoreService();

          UserModel model = UserModel(
            apellidoMaterno: apeMaternoController.text,
            apellidoPaterno: apePaternoController.text,
            email: emailController.text,
            imagen: "",
            nombre: nombresController.text,
            telefono: "",
            tipo: "final_user",
          );

          String id = await firestoreService.registerUser(model);
          if (id.isNotEmpty) {
            SPGlobal().isLogin = true;
            SPGlobal().id = id;
            isLoading = false;
            setState(() {});
            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
                (route) => false);
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      //print("error:::: ${e.code}");
      if (e.code == "weak-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarError(
              "La contraseña es muy debil, debe tener como minimo 6 caracteres."),
        );
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarError("El correo electronico ya esta registrado"),
        );
      }
      isLoading = false;
      setState(() {});
    }
  }

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
              padding: const EdgeInsets.all(20.0),
              height: ResponsiveUI.pHeight(context, 1) -
                  appBarHeight -
                  20 -
                  16, //cHeight - appBarHeight - 20 - 16,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width:
                            ResponsiveUI.pWidth(context, 0.2), //cWidth * 0.2,
                        height:
                            ResponsiveUI.pWidth(context, 0.2), //cWidth * 0.2,
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
                            key: formKeyRegister,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextFieldCommonWidget(
                                  controller: nombresController,
                                  hintText: "Nombres",
                                  icon: const Icon(
                                    Icons.person,
                                    color: BrandColor.cGreyColor,
                                  ),
                                  type: InputType.text,
                                ),
                                spacing10,
                                TextFieldCommonWidget(
                                  controller: apePaternoController,
                                  hintText: "Apellido Paterno",
                                  icon: const Icon(
                                    Icons.person,
                                    color: BrandColor.cGreyColor,
                                  ),
                                  type: InputType.text,
                                ),
                                spacing10,
                                TextFieldCommonWidget(
                                  controller: apeMaternoController,
                                  hintText: "Apellido Materno",
                                  icon: const Icon(
                                    Icons.person,
                                    color: BrandColor.cGreyColor,
                                  ),
                                  type: InputType.text,
                                ),
                                spacing10,
                                TextFieldCommonWidget(
                                  controller: emailController,
                                  hintText: "Email",
                                  icon: const Icon(
                                    Icons.person,
                                    color: BrandColor.cGreyColor,
                                  ),
                                  type: InputType.text,
                                ),
                                spacing10,
                                TextFielPasswordWidget(
                                  controller: passwordController,
                                ),
                                spacing10,
                                CommonButtonWiget(
                                  label: "CREAR CUENTA",
                                  onPressed: () {
                                    registerUser();
                                  },
                                  backColor: BrandColor.cGreenColor,
                                  textColor: BrandColor.cBlackColor,
                                ),
                                // spacing10,
                                // ConnectSocialWidet(),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: ResponsiveUI.pHeight(context, 0.39),
                          child: Container(
                            width: ResponsiveUI.pWidth(context, 0.92),
                            height: ResponsiveUI.pHeight(context, 0.30),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AssetData.imageImgSignUp),
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
          isLoading
              ? Container(
                  color: Colors.white70,
                  child: loadingWidget,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
