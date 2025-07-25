part of 'user_bloc.bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = Initial;
  const factory UserState.loading() = Loading;
  const factory UserState.success(UserModel user) = Success;
  const factory UserState.error(String message) = Error;
}
