import '../../model/trip/trip_model.dart';
import '../../repositories/trip/trip_repository.dart';

class GetTripsWithHostUsecase {

  GetTripsWithHostUsecase(this.tripRepository);
  final TripRepository tripRepository;

  Future<List<TripModel>> call (Map<String,dynamic> hostId) async {
    return await tripRepository.getTripsWithHost(hostId);
  }
}