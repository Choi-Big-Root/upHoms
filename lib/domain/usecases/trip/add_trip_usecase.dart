import '../../model/trip/trip_model.dart';
import '../../repositories/trip/trip_repository.dart';

class AddTripUsecase{
  AddTripUsecase(this.tripRepository);
  final TripRepository tripRepository;

  Future<void> call (TripModel trip) async {
    await tripRepository.addTrip(trip);
  }
}