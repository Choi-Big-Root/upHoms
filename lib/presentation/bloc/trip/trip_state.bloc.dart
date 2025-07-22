part of 'trip_bloc.bloc.dart';

@freezed
class TripState with _$TripState {
  const factory TripState.initial() = Initial;
  const factory TripState.loading() = Loading;
  const factory TripState.success() = Success;
  const factory TripState.error(String message) = Error;
  const factory TripState.addTripSuccess(TripModel trip) = AddTripSuccess;
  const factory TripState.getTripSuccess(TripModel trip) = GetTripSuccess;
}