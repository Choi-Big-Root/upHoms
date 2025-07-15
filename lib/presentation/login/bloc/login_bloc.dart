import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uphoms/domain/entities/user.dart';
import 'package:uphoms/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(const LoginState.initial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loading());
    try {
      final user = await loginUseCase(event.id, event.password);
      emit(LoginState.success(user: user));
    } catch (e) {
      emit(LoginState.failure(message: e.toString()));
    }
  }
}