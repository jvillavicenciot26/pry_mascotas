import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pry_mascotas/models/user_model.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';
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
  bool isLoading = false;
  FirestoreService firestoreService = FirestoreService();

  login() async {
    try {
      if (formKeyLogin.currentState!.validate()) {
        isLoading = true;
        setState(() {});

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (userCredential.user != null) {
          UserModel? userModel =
              await firestoreService.getUser(emailController.text);

          if (userModel != null) {
            SPGlobal().id = userModel.id!;
            SPGlobal().isLogin = true;
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
      isLoading = false;
      setState(() {});
      if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarError("La contraseña es incorrecta."),
        );
      } else if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarError("El correo electronico no esta registrado."),
        );
      } else if (e.code == "invalid-email") {
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarError("Formato de correo erroneo."),
        );
      }
    }
  }

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
  loginWithGoogle() async {
    isLoading = true;
    setState(() {});
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      isLoading = false;
      setState(() {});
      return;
    }

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    List<String> apellidos = userCredential
        .additionalUserInfo!.profile!["family_name"]
        .toString()
        .split(" ");
    if (userCredential.user != null) {
      UserModel? userModel =
          await firestoreService.getUser(userCredential.user!.email!);

      if (userModel == null) {
        String idCreated = await firestoreService.registerUser(
          UserModel(
            apellidoMaterno: apellidos.length >= 1 ? apellidos[1] : "",
            apellidoPaterno: apellidos.isNotEmpty ? apellidos[0] : "",
            email: userCredential.user!.email!,
            imagen: userCredential.user!.photoURL!,
            nombre: userCredential.additionalUserInfo!.profile!["given_name"],
            telefono: "",
            tipo: "final_user",
          ),
        );
        if (idCreated.isNotEmpty) {
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
      } else {
        SPGlobal().id = userModel.id!;
        SPGlobal().isLogin = true;
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

  loginWithFacebook() async {
    LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      Map<String, dynamic> userData = await FacebookAuth.instance.getUserData();

      AccessToken? accessToken = loginResult.accessToken;

      OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken!.token);

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      List<String> apellidos = userCredential
          .additionalUserInfo!.profile!["last_name"]
          .toString()
          .split(" ");
      if (userCredential.user != null) {
        UserModel? userModel =
            await firestoreService.getUser(userCredential.user!.email!);

        if (userModel == null) {
          String idCreated = await firestoreService.registerUser(
            UserModel(
              apellidoMaterno: apellidos.length >= 1 ? apellidos[1] : "",
              apellidoPaterno: apellidos.isNotEmpty ? apellidos[0] : "",
              email: userCredential.user!.email!,
              imagen: userCredential.additionalUserInfo!.profile!["picture"]
                  ["data"]["url"],
              nombre: userCredential.additionalUserInfo!.profile!["first_name"],
              telefono: "",
              tipo: "final_user",
            ),
          );
          if (idCreated.isNotEmpty) {
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
        } else {
          SPGlobal().id = userModel.id!;
          SPGlobal().isLogin = true;
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
                                    login();
                                  },
                                  backColor: BrandColor.cGreenColor,
                                  textColor: BrandColor.cBlackColor,
                                ),
                                spacing10,
                                //ConnectSocialWidet(),
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
                                            onPressed: loginWithFacebook,
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
                                            onPressed: loginWithGoogle,
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
