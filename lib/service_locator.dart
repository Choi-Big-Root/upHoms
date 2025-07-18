import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/remote/user/user_api_service.dart';
import 'data/remote/user/user_remote_data_source.dart';
import 'data/remote/user/user_remote_data_source_impl.dart';
import 'data/repositories/user/user_repository_impl.dart';
import 'domain/repositories/user/user_repository.dart';
import 'domain/usecases/user/create_account_usecase.dart';
import 'domain/usecases/user/get_user_usecase.dart';
import 'presentation/bloc/user/user_bloc.bloc.dart';

final locator = GetIt.instance;

void setLocator() {
  _data();
  _domain();
  _presentation();
}

void _data() {
  final dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';
  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<UserApiService>(UserApiService(locator<Dio>()));
  locator.registerSingleton<UserRemoteDataSource>(
    UserRemoteDataSourceImpl(locator<UserApiService>()),
  );
  locator.registerSingleton<UserRepository>(
    UserRepositoryImpl(locator<UserRemoteDataSource>()),
  );
}

void _domain() {
  locator.registerSingleton<CreateAccountUsecase>(
    CreateAccountUsecase(locator<UserRepository>()),
  );
  locator.registerSingleton<GetUserUsecase>(
    GetUserUsecase(locator<UserRepository>()),
  );
}

void _presentation() {
  // locator : 냉장고
  // registerFactory : 내가 냉장고에서 UserBloc 찾을때마다 계속 생성.
  // UserBloc를 만드려면 CreateUserUsecase 가 있어야하고
  // CreateUserUsecase 냉장고[locator]에 이미 넣어둔 상태.
  locator.registerFactory(
    () => UserBloc(
      createUserUsecase: locator<CreateAccountUsecase>(),
      getUserUsecase: locator<GetUserUsecase>(),
    ),
  );
}
