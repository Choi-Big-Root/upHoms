import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/trip/trip_model.dart';
import '../../../domain/usecases/trip/add_trip_usecase.dart';
import '../../../domain/usecases/trip/get_trip_usecase.dart';
import 'trip_bloc.bloc.dart';

part 'trip_event.bloc.dart';
part 'trip_state.bloc.dart';

part 'trip_bloc.bloc.freezed.dart';

class TripBloc extends Bloc<TripEvent,TripState>{
  final AddTripUsecase _addTripUsecase;
  final GetTripUsecase _getTripUsecase;

  TripBloc({
    required AddTripUsecase addTripUsecase,
    required GetTripUsecase getTripUsecase,
}): _addTripUsecase = addTripUsecase,
        _getTripUsecase = getTripUsecase,
  super(const TripState.initial()){
    on<AddTrip>(_onAddTrip);
    on<GetTrip>(_onGetTrip);
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
}
