import 'package:pry_mascotas/bloc/login/login_state.dart';
import 'package:pry_mascotas/models/user_model.dart';

abstract class LoginEvent {}

class LoginCredentialEvent extends LoginEvent {
  String email;
  String password;
  LoginCredentialEvent({required this.email, required this.password});
}

class LoginGoogleEvent extends LoginEvent {}

class LoginFacebookEvent extends LoginEvent {}

class LoginErrorEvent extends LoginEvent {
  String message;
  LoginErrorEvent({required this.message});
}

class LogoutEvent extends LoginEvent {
  String loginType;
  LogoutEvent({required this.loginType});
}
