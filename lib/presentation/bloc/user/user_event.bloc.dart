part of 'user_bloc.bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class CreateUser extends UserEvent {
  CreateUser(this.user);
  final UserModel user;
}
class GetUser extends UserEvent {
  GetUser(this.user);
  final UserModel user;
}

class UpdateUser extends UserEvent {
  UpdateUser(this.user);
  final UserModel user;
}