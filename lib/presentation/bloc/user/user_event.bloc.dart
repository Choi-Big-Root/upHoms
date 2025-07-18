part of 'user_bloc.bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class CreateUser extends UserEvent {
  CreateUser(this.user);
  final UserModel user;
}