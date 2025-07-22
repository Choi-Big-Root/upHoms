import '../../../domain/model/trip/trip_model.dart';
import '../../../domain/repositories/trip/trip_repository.dart';
import '../../remote/trip/trip_remote_data_source.dart';

class TripRepositoryImpl implements TripRepository {
  TripRepositoryImpl(this.tripRemoteDataSource);
  final TripRemoteDataSource tripRemoteDataSource;

  @override
  Future<TripModel> addTrip(TripModel trip) async {
    return await tripRemoteDataSource.addTrip(trip);
  }

  @override
  Future<TripModel> getTrip(Map<String, dynamic> tripId) async {
    return await tripRemoteDataSource.getTrip(tripId);
  }
}