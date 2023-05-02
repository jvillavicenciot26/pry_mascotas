abstract class SignupEvent {}

class SignupCreateAccountEvent extends SignupEvent {
  String email;
  String password;
  String nombres;
  String paterno;
  String materno;
  SignupCreateAccountEvent({
    required this.email,
    required this.password,
    required this.nombres,
    required this.paterno,
    required this.materno,
  });
}

class SignupErrorEvent extends SignupEvent {
  String errorMessage;
  SignupErrorEvent({required this.errorMessage});
}
