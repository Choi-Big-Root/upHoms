part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed(this.id,this.password);

  final String id;
  final String password;
}