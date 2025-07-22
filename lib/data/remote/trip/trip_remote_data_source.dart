import '../../../domain/model/trip/trip_model.dart';

abstract class TripRemoteDataSource {
  Future<void> addTrip(TripModel trip);
}