import 'package:pry_mascotas/models/user_model.dart';

abstract class LoginState {
  bool isLogin;
  UserModel? userModel;
  LoginState({this.userModel, this.isLogin = false});
}

class LoginInitState extends LoginState {
  LoginInitState() : super(isLogin: false, userModel: null);
}

class LoginLoadingState extends LoginState {
  LoginLoadingState({required super.userModel});
}

class LoginSuccedState extends LoginState {
  LoginSuccedState({required super.userModel, super.isLogin});
}

class LogOutState extends LoginState {
  LogOutState({required super.userModel, super.isLogin});
}

class LoginErrorState extends LoginState {
  String errorMessage;
  LoginErrorState({required super.userModel, required this.errorMessage});
}
