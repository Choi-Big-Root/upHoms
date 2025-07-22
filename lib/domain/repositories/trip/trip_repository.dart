import '../../model/trip/trip_model.dart';

abstract class TripRepository {
  Future<void> addTrip(TripModel trip);
}