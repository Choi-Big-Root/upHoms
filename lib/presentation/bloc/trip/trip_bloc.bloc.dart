import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/trip/trip_model.dart';
import '../../../domain/usecases/trip/add_trip_usecase.dart';
import '../../../domain/usecases/trip/get_trip_usecase.dart';
import '../../../domain/usecases/trip/get_trips_with_user_usecase.dart';
import 'trip_bloc.bloc.dart';

part 'trip_event.bloc.dart';

part 'trip_state.bloc.dart';

part 'trip_bloc.bloc.freezed.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final AddTripUsecase _addTripUsecase;
  final GetTripUsecase _getTripUsecase;
  final GetTripsWithUserUsecase _getTripsWithUserUsecase;

  TripBloc({
    required AddTripUsecase addTripUsecase,
    required GetTripUsecase getTripUsecase,
    required GetTripsWithUserUsecase getTripsWithUserUsecase,
  }) : _addTripUsecase = addTripUsecase,
       _getTripUsecase = getTripUsecase,
       _getTripsWithUserUsecase = getTripsWithUserUsecase,
       super(const TripState.initial()) {
    on<AddTrip>(_onAddTrip);
    on<GetTrip>(_onGetTrip);
    on<GetTripsWithUser>(_onGetTripsWithUser);
  }

  Future<void> _onAddTrip(AddTrip event, Emitter<TripState> emit) async {
    emit(const TripState.loading());
    try {
      final tripModel = await _addTripUsecase(event.tripModel);
      emit(TripState.addTripSuccess(tripModel));
    } catch (e) {
      emit(TripState.error(e.toString()));
    }
  }

  Future<void> _onGetTrip(GetTrip event, Emitter<TripState> emit) async {
    emit(const TripState.loading());
    try {
      final tripModel = await _getTripUsecase(event.tripId);
      emit(TripState.getTripSuccess(tripModel));
    } catch (e) {
      emit(TripState.error(e.toString()));
    }
  }
  
  Future<void> _onGetTripsWithUser(GetTripsWithUser event, Emitter<TripState> emit) async {
    emit(const TripState.loading());
    try {
      final tripModels = await _getTripsWithUserUsecase(event.userId);
      emit(TripState.getTripsWithUserSuccess(tripModels));
    } catch (e) {
      emit(TripState.error(e.toString()));
    }
  }
}
