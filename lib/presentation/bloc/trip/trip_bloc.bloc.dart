import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/trip/trip_model.dart';
import '../../../domain/usecases/trip/add_trip_usecase.dart';
import 'trip_bloc.bloc.dart';

part 'trip_event.bloc.dart';
part 'trip_state.bloc.dart';

part 'trip_bloc.bloc.freezed.dart';

class TripBloc extends Bloc<TripEvent,TripState>{
  final AddTripUsecase _addTripUsecase;

  TripBloc({
    required AddTripUsecase addTripUsecase,
}): _addTripUsecase = addTripUsecase,
  super(const TripState.initial()){
    on<AddTrip>(_onAddTrip);
  }

  Future<void> _onAddTrip(AddTrip event, Emitter<TripState> emit) async {
    emit(const TripState.loading());
    try {
      await _addTripUsecase(event.tripModel);
      emit(const TripState.addTripSuccess());
    } catch (e) {
      emit(TripState.error(e.toString()));
    }
  }
}
