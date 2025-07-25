import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/constants.dart';
import 'data/remote/property/property_api_service.dart';
import 'data/remote/property/property_remote_data_source.dart';
import 'data/remote/property/property_remote_data_source_impl.dart';
import 'data/remote/review/review_api_service.dart';
import 'data/remote/review/review_remote_data_source.dart';
import 'data/remote/review/review_remote_data_source_impl.dart';
import 'data/remote/trip/trip_api_service.dart';
import 'data/remote/trip/trip_remote_data_source.dart';
import 'data/remote/trip/trip_remote_data_source_impl.dart';
import 'data/remote/user/user_api_service.dart';
import 'data/remote/user/user_remote_data_source.dart';
import 'data/remote/user/user_remote_data_source_impl.dart';
import 'data/repositories/property/property_repository_impl.dart';
import 'data/repositories/review/review_repository_impl.dart';
import 'data/repositories/trip/trip_repository_impl.dart';
import 'data/repositories/user/user_repository_impl.dart';
import 'domain/repositories/property/property_repository.dart';
import 'domain/repositories/review/review_repository.dart';
import 'domain/repositories/trip/trip_repository.dart';
import 'domain/repositories/user/user_repository.dart';
import 'domain/usecases/property/add_property_usecase.dart';
import 'domain/usecases/property/get_all_properties_usecase.dart';
import 'domain/usecases/property/get_property_usecase.dart';
import 'domain/usecases/property/get_search_propertiesa_usecase.dart';
import 'domain/usecases/property/update_property_usecase.dart';
import 'domain/usecases/review/add_review_usecase.dart';
import 'domain/usecases/review/get_reviews_usecase.dart';
import 'domain/usecases/trip/add_trip_usecase.dart';
import 'domain/usecases/trip/cancel_trip_usecase.dart';
import 'domain/usecases/trip/complete_trip_usecase.dart';
import 'domain/usecases/trip/get_trip_usecase.dart';
import 'domain/usecases/trip/get_trips_with_host_usecase.dart';
import 'domain/usecases/trip/get_trips_with_user_usecase.dart';
import 'domain/usecases/user/create_account_usecase.dart';
import 'domain/usecases/user/get_user_usecase.dart';
import 'domain/usecases/user/update_user_usecase.dart';
import 'presentation/bloc/property/property_bloc.bloc.dart';
import 'presentation/bloc/review/review_bloc.bloc.dart';
import 'presentation/bloc/trip/trip_bloc.bloc.dart';
import 'presentation/bloc/user/user_bloc.bloc.dart';
import 'presentation/cubit/message_cubit.dart';

final locator = GetIt.instance;

void setLocator() {
  _data();
  _domain();
  _presentation();
}

void _data() {
  final dio = Dio();
  dio.options.baseUrl = AppConstants.localServerUrl;
  dio.options.headers['Content-Type'] = 'application/json';

  //dio
  locator.registerSingleton<Dio>(dio);

  //user
  locator.registerSingleton<UserApiService>(UserApiService(locator<Dio>()));
  locator.registerSingleton<UserRemoteDataSource>(
    UserRemoteDataSourceImpl(locator<UserApiService>()),
  );
  locator.registerSingleton<UserRepository>(
    UserRepositoryImpl(locator<UserRemoteDataSource>()),
  );

  //property
  locator.registerSingleton<PropertyApiService>(
    PropertyApiService(locator<Dio>()),
  );
  locator.registerSingleton<PropertyRemoteDataSource>(
    PropertyRemoteDataSourceImpl(locator<PropertyApiService>()),
  );
  locator.registerSingleton<PropertyRepository>(
    PropertyRepositoryImpl(locator<PropertyRemoteDataSource>()),
  );

  //review
  locator.registerSingleton<ReviewApiService>(ReviewApiService(locator<Dio>()));
  locator.registerSingleton<ReviewRemoteDataSource>(
    ReviewRemoteDataSourceImpl(locator<ReviewApiService>()),
  );
  locator.registerSingleton<ReviewRepository>(
    ReviewRepositoryImpl(locator<ReviewRemoteDataSource>()),
  );

  //trip
  locator.registerSingleton<TripApiService>(TripApiService(locator<Dio>()));
  locator.registerSingleton<TripRemoteDataSource>(
    TripRemoteDataSourceImpl(locator<TripApiService>()),
  );
  locator.registerSingleton<TripRepository>(
    TripRepositoryImpl(locator<TripRemoteDataSource>()),
  );
}

void _domain() {
  //user
  locator.registerSingleton<CreateAccountUsecase>(
    CreateAccountUsecase(locator<UserRepository>()),
  );
  locator.registerSingleton<GetUserUsecase>(
    GetUserUsecase(locator<UserRepository>()),
  );
  locator.registerSingleton<UpdateUserUsecase>(
    UpdateUserUsecase(locator<UserRepository>()),
  );

  //property
  locator.registerSingleton<AddPropertyUsecase>(
    AddPropertyUsecase(locator<PropertyRepository>()),
  );
  locator.registerSingleton<GetAllPropertiesUsecase>(
    GetAllPropertiesUsecase(locator<PropertyRepository>()),
  );
  locator.registerSingleton<GetSearchPropertiesUsecase>(
    GetSearchPropertiesUsecase(locator<PropertyRepository>()),
  );
  locator.registerSingleton<GetPropertyUsecase>(
    GetPropertyUsecase(locator<PropertyRepository>()),
  );
  locator.registerSingleton<UpdatePropertyUsecase>(
    UpdatePropertyUsecase(locator<PropertyRepository>()),
  );


  //review
  locator.registerSingleton<GetReviewsUsecase>(
    GetReviewsUsecase(locator<ReviewRepository>()),
  );
  locator.registerSingleton<AddReviewUsecase>(
    AddReviewUsecase(locator<ReviewRepository>()),
  );

  //trip
  locator.registerSingleton<AddTripUsecase>(
    AddTripUsecase(locator<TripRepository>()),
  );
  locator.registerSingleton<GetTripUsecase>(
    GetTripUsecase(locator<TripRepository>()),
  );
  locator.registerSingleton<GetTripsWithUserUsecase>(
    GetTripsWithUserUsecase(locator<TripRepository>()),
  );
  locator.registerSingleton<CancelTripUsecase>(
    CancelTripUsecase(locator<TripRepository>()),
  );
  locator.registerSingleton<GetTripsWithHostUsecase>(
    GetTripsWithHostUsecase(locator<TripRepository>()),
  );
  locator.registerSingleton<CompleteTripUsecase>(
    CompleteTripUsecase(locator<TripRepository>()),
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
      updateUserUsecase: locator<UpdateUserUsecase>(),
    ),
  );

  locator.registerFactory(
    () => PropertyBloc(
      addPropertyUsecase: locator<AddPropertyUsecase>(),
      getAllPropertiesUsecase: locator<GetAllPropertiesUsecase>(),
      getSearchPropertiesUsecase: locator<GetSearchPropertiesUsecase>(),
      getPropertyUsecase: locator<GetPropertyUsecase>(),
      updatePropertyUsecase: locator<UpdatePropertyUsecase>(),
    ),
  );

  locator.registerFactory(
    () => ReviewBloc(
      getReviewsUsecase: locator<GetReviewsUsecase>(),
      addReviewUsecase: locator<AddReviewUsecase>(),
    ),
  );

  locator.registerFactory(
    () => TripBloc(
      addTripUsecase: locator<AddTripUsecase>(),
      getTripUsecase: locator<GetTripUsecase>(),
      getTripsWithUserUsecase: locator<GetTripsWithUserUsecase>(),
      cancelTripUsecase: locator<CancelTripUsecase>(),
      getTripsWithHostUsecase: locator<GetTripsWithHostUsecase>(),
      completeTripUsecase: locator<CompleteTripUsecase>(),
    ),
  );

  locator.registerSingleton<MessageCubit>(MessageCubit());
}
