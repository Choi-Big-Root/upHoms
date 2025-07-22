import '../../../domain/model/trip/trip_model.dart';
import '../../../domain/repositories/trip/trip_repository.dart';
import '../../remote/trip/trip_remote_data_source.dart';

class TripRepositoryImpl implements TripRepository {
  TripRepositoryImpl(this.tripRemoteDataSource);
  final TripRemoteDataSource tripRemoteDataSource;

  @override
  Future<void> addTrip(TripModel trip) async {
    await tripRemoteDataSource.addTrip(trip);
  }
}