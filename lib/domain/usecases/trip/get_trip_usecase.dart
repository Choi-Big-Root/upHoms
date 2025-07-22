import '../../model/trip/trip_model.dart';
import '../../repositories/trip/trip_repository.dart';

class GetTripUsecase {

  GetTripUsecase(this.tripRepository);
  final TripRepository tripRepository;

  Future<TripModel> call (Map<String,dynamic> propertyId) async {
    return await tripRepository.getTrip(propertyId);
  }
}