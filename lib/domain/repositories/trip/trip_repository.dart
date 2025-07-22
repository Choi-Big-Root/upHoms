import '../../model/trip/trip_model.dart';

abstract class TripRepository {
  Future<TripModel> addTrip(TripModel trip);
  Future<TripModel> getTrip(Map<String,dynamic> tripId);
}