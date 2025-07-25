import '../../model/trip/trip_model.dart';

abstract class TripRepository {
  Future<TripModel> addTrip(TripModel trip);
  Future<TripModel> getTrip(Map<String,dynamic> tripId);
  Future<List<TripModel>> getTripsWithUser(Map<String,dynamic> userId);
  Future<TripModel> cancelTrip(TripModel trip);
  Future<List<TripModel>> getTripsWithHost(Map<String,dynamic> hostId);
  Future<TripModel> completeTrip(TripModel trip);
}