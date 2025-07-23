import '../../model/trip/trip_model.dart';
import '../../repositories/trip/trip_repository.dart';

class CancelTripUsecase {

  CancelTripUsecase(this.tripRepository);
  final TripRepository tripRepository;

  Future<TripModel> call (TripModel trip) async {
    return await tripRepository.cancelTrip(trip);
  }
}