import '../../../domain/model/trip/trip_model.dart';

abstract class TripRemoteDataSource {
  Future<TripModel> addTrip(TripModel trip);
  Future<TripModel> getTrip(Map<String,dynamic> tripId);
  Future<List<TripModel>> getTripsWithUser(Map<String,dynamic> userId);
  Future<TripModel> cancelTrip(TripModel trip);
}