import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/user/user_model.dart';
import '../../../../domain/usecases/user/create_account_usecase.dart';

part 'user_bloc.bloc.freezed.dart';
part 'user_event.bloc.dart';
part 'user_state.bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CreateAccountUsecase _createUserUsecase;

  UserBloc({
    required CreateAccountUsecase createUserUsecase,
  })  : _createUserUsecase = createUserUsecase,
        super(const UserState.initial()) {
    on<CreateUser>(_onCreateUser);
  }

  Future<void> _onCreateUser(CreateUser event, Emitter<UserState> emit) async {
    emit(const UserState.loading());
    try {
      await _createUserUsecase(event.user);
      emit(const UserState.success());
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }
}
