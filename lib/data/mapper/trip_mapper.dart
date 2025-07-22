import '../../domain/model/property/property_model.dart';
import '../../domain/model/trip/trip_model.dart';
import '../../domain/model/user/user_model.dart';
import '../dto/property/property_dto.dart';
import '../dto/trip/trip_dto.dart';
import 'property_mapper.dart';
import 'user_mapper.dart';

class TripMapper {
  static TripDto toDto(TripModel model){
    return TripDto(
      tripId: model.tripId ?? -1,
      propertyId: model.propertyId ?? -1,
      userId:  model.userId ?? -1,
      property: PropertyMapper.toDto(model.property ?? const PropertyModel()),
      user: UserMapper.toDto(model.user ?? const UserModel()),
      tripBeginDate: model.tripBeginDate ?? '',
      tripEndDate: model.tripEndDate ?? '',
      tripCost: model.tripCost ?? 0.0,
      guests: model.guests ?? -1,
      paymentMethod: model.paymentMethod ?? '',
      tripCreated: model.tripCreated ?? '',
      hostId: model.hostId ?? -1,
      host: UserMapper.toDto(model.user ?? const UserModel()),
      cancelTrip: model.cancelTrip ?? false,
      cancelReason: model.cancelReason ?? '',
      tripTotal: model.tripTotal ?? -1,
      upcoming: model.upcoming ?? false,
      rated:  model.rated ?? false,
    );
  }

  static TripModel toModel(TripDto dto){
    return TripModel(
      tripId: dto.tripId,
      propertyId: dto.propertyId,
      userId:  dto.userId,
      property: PropertyMapper.toModel(dto.property),
      user: UserMapper.toModel(dto.user),
      tripBeginDate: dto.tripBeginDate ,
      tripEndDate: dto.tripEndDate ,
      tripCost: dto.tripCost,
      guests: dto.guests ,
      paymentMethod: dto.paymentMethod,
      tripCreated: dto.tripCreated,
      hostId: dto.hostId,
      host: UserMapper.toModel(dto.host),
      cancelTrip: dto.cancelTrip,
      cancelReason: dto.cancelReason,
      tripTotal: dto.tripTotal,
      upcoming: dto.upcoming,
      rated:  dto.rated,
    );
  }
}