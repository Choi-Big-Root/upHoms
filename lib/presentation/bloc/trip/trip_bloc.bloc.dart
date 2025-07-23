import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/trip/trip_model.dart';
import '../../../domain/usecases/trip/add_trip_usecase.dart';
import '../../../domain/usecases/trip/cancel_trip_usecase.dart';
import '../../../domain/usecases/trip/complete_trip_usecase.dart';
import '../../../domain/usecases/trip/get_trip_usecase.dart';
import '../../../domain/usecases/trip/get_trips_with_host_usecase.dart';
import '../../../domain/usecases/trip/get_trips_with_user_usecase.dart';
import 'trip_bloc.bloc.dart';

part 'trip_event.bloc.dart';

part 'trip_state.bloc.dart';

part 'trip_bloc.bloc.freezed.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final AddTripUsecase _addTripUsecase;
  final GetTripUsecase _getTripUsecase;
  final GetTripsWithUserUsecase _getTripsWithUserUsecase;
  final CancelTripUsecase _cancelTripUsecase;
  final GetTripsWithHostUsecase _getTripsWithHostUsecase;
  final CompleteTripUsecase _completeTripUsecase;

  TripBloc({
    required AddTripUsecase addTripUsecase,
    required GetTripUsecase getTripUsecase,
    required GetTripsWithUserUsecase getTripsWithUserUsecase,
    required CancelTripUsecase cancelTripUsecase,
    required GetTripsWithHostUsecase getTripsWithHostUsecase,
    required CompleteTripUsecase completeTripUsecase,
  }) : _addTripUsecase = addTripUsecase,
       _getTripUsecase = getTripUsecase,
       _getTripsWithUserUsecase = getTripsWithUserUsecase,
       _cancelTripUsecase = cancelTripUsecase,
       _getTripsWithHostUsecase = getTripsWithHostUsecase,
       _completeTripUsecase = completeTripUsecase,

       super(const TripState.initial()) {
    on<AddTrip>(_onAddTrip);
    on<GetTrip>(_onGetTrip);
    on<GetTripsWithUser>(_onGetTripsWithUser);
    on<CancelTrip>(_onCancelTrip);
    on<GetTripsWithHost>(_onGetTripsWithHost);
    on<CompleteTrip>(_onCompleteTrip);
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

  Future<void> _onGetTripsWithUser(
    GetTripsWithUser event,
    Emitter<TripState> emit,
  ) async {
    emit(const TripState.loading());
    try {
      final tripModels = await _getTripsWithUserUsecase(event.userId);
      emit(TripState.getTripsWithUserSuccess(tripModels));
    } catch (e) {
      emit(TripState.error(e.toString()));
    }
  }

  Future<void> _onCancelTrip(CancelTrip event, Emitter<TripState> emit) async {
    emit(const TripState.loading());
    try {
      final tripModel = await _cancelTripUsecase(event.trip);
      emit(TripState.cancelTripSuccess(tripModel));
    } catch (e) {
      emit(TripState.error(e.toString()));
    }
  }

  Future<void> _onGetTripsWithHost(
    GetTripsWithHost event,
    Emitter<TripState> emit,
  ) async {
    emit(const TripState.loading());
    try {
      final tripModels = await _getTripsWithHostUsecase(event.hostId);
      emit(TripState.getTripsWithHostSuccess(tripModels));
    } catch (e) {
      emit(TripState.error(e.toString()));
    }
  }

  Future<void> _onCompleteTrip(
    CompleteTrip event,
    Emitter<TripState> emit,
  ) async {
    emit(const TripState.loading());
    try {
      final tripModel = await _completeTripUsecase(event.trip);
      emit(TripState.completeTripSuccess(tripModel));
    } catch (e) {
      emit(TripState.error(e.toString()));
    }
  }
}
