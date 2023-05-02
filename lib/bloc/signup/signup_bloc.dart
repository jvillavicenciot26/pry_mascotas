import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pry_mascotas/bloc/signup/signup_event.dart';
import 'package:pry_mascotas/bloc/signup/signup_state.dart';
import 'package:pry_mascotas/models/user_model.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';
import 'package:pry_mascotas/services/remote/firestore_service.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitState()) {
    on<SignupCreateAccountEvent>(
      (event, emit) async {
        try {
          emit(SignupLoadingState());
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          if (userCredential.user != null) {
            FirestoreService firestoreService = FirestoreService();

            UserModel model = UserModel(
              apellidoMaterno: event.materno,
              apellidoPaterno: event.paterno,
              email: event.email,
              imagen: "",
              nombre: event.nombres,
              telefono: "",
              tipo: "final_user",
            );

            String id = await firestoreService.registerUser(model);
            if (id.isNotEmpty) {
              SPGlobal().isLogin = true;
              SPGlobal().id = id;
              SPGlobal().loginType = "C"; // Credentials
              emit(SignupSuccedState(userModel: model, isLogin: true));
            } else {
              emit(
                SignupErrorState(errorMessage: "Error al registrar usuario."),
              );
            }
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "weak-password") {
            emit(
              SignupErrorState(
                errorMessage:
                    "La contraseña es muy debil, debe tener como minimo 6 caracteres.",
              ),
            );
          } else if (e.code == "email-already-in-use") {
            emit(
              SignupErrorState(
                errorMessage: "El correo electronico ya esta registrado.",
              ),
            );
          }
        }
      },
    );
  }
}
