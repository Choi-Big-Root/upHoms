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

class GetTripsWithUser extends TripEvent {
  const GetTripsWithUser(this.userId);
  final Map<String, dynamic> userId;
}
class CancelTrip extends TripEvent {
  const CancelTrip(this.trip);
  final TripModel trip;
}
class GetTripsWithHost extends TripEvent {
  const GetTripsWithHost(this.hostId);
  final Map<String, dynamic> hostId;
}
class CompleteTrip extends TripEvent {
  const CompleteTrip(this.trip);
  final TripModel trip;
}