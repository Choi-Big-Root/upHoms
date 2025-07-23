import '../../model/trip/trip_model.dart';
import '../../repositories/trip/trip_repository.dart';

class GetTripsWithUserUsecase {

  GetTripsWithUserUsecase(this.tripRepository);
  final TripRepository tripRepository;

  Future<List<TripModel>> call (Map<String,dynamic> userId) async {
    return await tripRepository.getTripsWithUser(userId);
  }
}