import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pry_mascotas/bloc/login/login_event.dart';
import 'package:pry_mascotas/bloc/login/login_state.dart';
import 'package:pry_mascotas/models/user_model.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';
import 'package:pry_mascotas/services/remote/firestore_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitState()) {
    FirestoreService firestoreService = FirestoreService();

    on<LoginCredentialEvent>((event, emit) async {
      try {
        emit(LoginLoadingState(userModel: null));
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        if (userCredential.user != null) {
          UserModel? userModel = await firestoreService.getUser(event.email);
          if (userModel != null) {
            SPGlobal().id = userModel.id!;
            SPGlobal().isLogin = true;
            SPGlobal().loginType = "C"; // Credentials
            emit(LoginSuccedState(userModel: userModel, isLogin: true));
          }
        }
      } on FirebaseAuthException catch (e) {
        String message = "";
        if (e.code == "wrong-password") {
          message = "La contraseña es incorrecta.";
        } else if (e.code == "user-not-found") {
          message = "El correo electronico no esta registrado.";
        } else if (e.code == "invalid-email") {
          message = "Formato de correo erróneo.";
        }
        emit(LoginErrorState(userModel: null, errorMessage: message));
      }
    });

    on<LoginGoogleEvent>((event, emit) async {
      emit(LoginLoadingState(userModel: null));
      GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        emit(
          LoginErrorState(
            userModel: null,
            errorMessage: "Error al iniciar con Google.",
          ),
        );
      } else {
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

        UserModel? userModel;
        if (userCredential.user != null) {
          userModel =
              await firestoreService.getUser(userCredential.user!.email!);

          if (userModel == null) {
            userModel = UserModel(
              apellidoMaterno: apellidos.length >= 1 ? apellidos[1] : "",
              apellidoPaterno: apellidos.isNotEmpty ? apellidos[0] : "",
              email: userCredential.user!.email!,
              imagen: userCredential.user!.photoURL!,
              nombre: userCredential.additionalUserInfo!.profile!["given_name"],
              telefono: "",
              tipo: "final_user",
            );
            String idCreated = await firestoreService.registerUser(userModel);
            if (idCreated.isNotEmpty) {
              SPGlobal().id = userModel.id!;
              SPGlobal().isLogin = true;
              SPGlobal().loginType = "G"; // Google
              emit(LoginSuccedState(userModel: userModel, isLogin: true));
            } else {
              emit(
                LoginErrorState(
                  userModel: null,
                  errorMessage: "Error al registrar usuario.",
                ),
              );
            }
          } else {
            SPGlobal().id = userModel.id!;
            SPGlobal().isLogin = true;
            SPGlobal().loginType = "G"; // Google
            emit(LoginSuccedState(userModel: userModel, isLogin: true));
          }
        }
      }
    });

    on<LoginFacebookEvent>((event, emit) async {
      emit(LoginLoadingState(userModel: null));
      LoginResult loginResult = await FacebookAuth.instance.login();
      //FacebookAuth.instance.logOut();
      if (loginResult.status == LoginStatus.success) {
        AccessToken? accessToken = loginResult.accessToken;

        OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken!.token);

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        List<String> apellidos = userCredential
            .additionalUserInfo!.profile!["last_name"]
            .toString()
            .split(" ");

        UserModel? userModel;
        if (userCredential.user != null) {
          userModel =
              await firestoreService.getUser(userCredential.user!.email!);

          if (userModel == null) {
            userModel = UserModel(
              apellidoMaterno: apellidos.length >= 1 ? apellidos[1] : "",
              apellidoPaterno: apellidos.isNotEmpty ? apellidos[0] : "",
              email: userCredential.user!.email!,
              imagen: userCredential.additionalUserInfo!.profile!["picture"]
                  ["data"]["url"],
              nombre: userCredential.additionalUserInfo!.profile!["first_name"],
              telefono: "",
              tipo: "final_user",
            );
            String idCreated = await firestoreService.registerUser(userModel);
            if (idCreated.isNotEmpty) {
              SPGlobal().id = userModel.id!;
              SPGlobal().isLogin = true;
              SPGlobal().loginType = "F"; // Google
              emit(LoginSuccedState(userModel: userModel, isLogin: true));
            } else {
              emit(
                LoginErrorState(
                  userModel: null,
                  errorMessage: "Error al registrar usuario.",
                ),
              );
            }
          }
        } else {
          SPGlobal().id = userModel!.id!;
          SPGlobal().isLogin = true;
          SPGlobal().loginType = "F"; // Facebook
          emit(LoginSuccedState(userModel: userModel, isLogin: true));
        }
      } else {
        emit(LoginErrorState(
            userModel: null,
            errorMessage: "Error al iniciar sesión con Facebook"));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(LoginLoadingState(userModel: null));

      if (event.loginType == "C") {
        await FirebaseAuth.instance.signOut();
      } else if (event.loginType == "G") {
        GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
        ;
        await googleSignIn.signOut();
      } else if (event.loginType == "F") {
        await FacebookAuth.instance.logOut();
      }
      emit(LogOutState(userModel: null, isLogin: false));
    });
  }
}
