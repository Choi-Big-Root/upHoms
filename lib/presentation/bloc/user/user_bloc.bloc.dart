import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/user/user_model.dart';
import '../../../../domain/usecases/user/create_account_usecase.dart';
import '../../../domain/usecases/user/get_user_usecase.dart';
import '../../../domain/usecases/user/update_user_usecase.dart';

part 'user_bloc.bloc.freezed.dart';

part 'user_event.bloc.dart';

part 'user_state.bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CreateAccountUsecase _createUserUsecase;
  final GetUserUsecase _getUserUsecase;
  final UpdateUserUsecase _updateUserUsecase;

  UserBloc({
    required CreateAccountUsecase createUserUsecase,
    required GetUserUsecase getUserUsecase,
    required UpdateUserUsecase updateUserUsecase,
  }) : _createUserUsecase = createUserUsecase,
       _getUserUsecase = getUserUsecase,
  _updateUserUsecase = updateUserUsecase,
       super(const UserState.initial()) {
    on<CreateUser>(_onCreateUser);
    on<GetUser>(_onGetUser);
    on<UpdateUser>(_onUpdateUser);
  }

  Future<void> _onCreateUser(CreateUser event, Emitter<UserState> emit) async {
    emit(const UserState.loading());
    try {
      await _createUserUsecase(event.user);
      emit(const UserState.success(UserModel()));
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }
  Future<void> _onGetUser(GetUser event, Emitter<UserState> emit) async {
    emit(const UserState.loading());
    try {
      final user = await _getUserUsecase(event.user);
      emit(UserState.success(user));
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }

  Future<void> _onUpdateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(const UserState.loading());
    try {
      final user = await _updateUserUsecase(event.user);
      emit(UserState.success(user));
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }
}
