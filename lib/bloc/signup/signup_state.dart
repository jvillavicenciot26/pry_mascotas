import 'package:pry_mascotas/models/user_model.dart';

abstract class SignupState {}

class SignupInitState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccedState extends SignupState {
  UserModel userModel;
  bool isLogin;
  SignupSuccedState({required this.userModel, required this.isLogin});
}

class SignupErrorState extends SignupState {
  String errorMessage;
  SignupErrorState({required this.errorMessage});
}
