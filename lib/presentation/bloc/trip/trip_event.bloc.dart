part of 'trip_bloc.bloc.dart';

abstract class TripEvent {
  const TripEvent();
}

class AddTrip extends TripEvent {

  AddTrip(this.tripModel);
  final TripModel tripModel;
}

class GetTrip extends TripEvent {
  const GetTrip(this.tripId);
  final Map<String, dynamic> tripId;
}