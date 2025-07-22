// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TripDto {

 int get tripId; int get propertyId; int get userId; PropertyDto get property; UserDto get user; String get tripBeginDate; String get tripEndDate; double get tripCost; int get guests; String get paymentMethod; String get tripCreated; dynamic get hostId; UserDto get host; bool get cancelTrip; String get cancelReason; int get tripTotal; bool get upcoming; bool get rated;
/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripDtoCopyWith<TripDto> get copyWith => _$TripDtoCopyWithImpl<TripDto>(this as TripDto, _$identity);

  /// Serializes this TripDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDto&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.property, property) || other.property == property)&&(identical(other.user, user) || other.user == user)&&(identical(other.tripBeginDate, tripBeginDate) || other.tripBeginDate == tripBeginDate)&&(identical(other.tripEndDate, tripEndDate) || other.tripEndDate == tripEndDate)&&(identical(other.tripCost, tripCost) || other.tripCost == tripCost)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.tripCreated, tripCreated) || other.tripCreated == tripCreated)&&const DeepCollectionEquality().equals(other.hostId, hostId)&&(identical(other.host, host) || other.host == host)&&(identical(other.cancelTrip, cancelTrip) || other.cancelTrip == cancelTrip)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.tripTotal, tripTotal) || other.tripTotal == tripTotal)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.rated, rated) || other.rated == rated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tripId,propertyId,userId,property,user,tripBeginDate,tripEndDate,tripCost,guests,paymentMethod,tripCreated,const DeepCollectionEquality().hash(hostId),host,cancelTrip,cancelReason,tripTotal,upcoming,rated);

@override
String toString() {
  return 'TripDto(tripId: $tripId, propertyId: $propertyId, userId: $userId, property: $property, user: $user, tripBeginDate: $tripBeginDate, tripEndDate: $tripEndDate, tripCost: $tripCost, guests: $guests, paymentMethod: $paymentMethod, tripCreated: $tripCreated, hostId: $hostId, host: $host, cancelTrip: $cancelTrip, cancelReason: $cancelReason, tripTotal: $tripTotal, upcoming: $upcoming, rated: $rated)';
}


}

/// @nodoc
abstract mixin class $TripDtoCopyWith<$Res>  {
  factory $TripDtoCopyWith(TripDto value, $Res Function(TripDto) _then) = _$TripDtoCopyWithImpl;
@useResult
$Res call({
 int tripId, int propertyId, int userId, PropertyDto property, UserDto user, String tripBeginDate, String tripEndDate, double tripCost, int guests, String paymentMethod, String tripCreated, dynamic hostId, UserDto host, bool cancelTrip, String cancelReason, int tripTotal, bool upcoming, bool rated
});


$PropertyDtoCopyWith<$Res> get property;$UserDtoCopyWith<$Res> get user;$UserDtoCopyWith<$Res> get host;

}
/// @nodoc
class _$TripDtoCopyWithImpl<$Res>
    implements $TripDtoCopyWith<$Res> {
  _$TripDtoCopyWithImpl(this._self, this._then);

  final TripDto _self;
  final $Res Function(TripDto) _then;

/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? propertyId = null,Object? userId = null,Object? property = null,Object? user = null,Object? tripBeginDate = null,Object? tripEndDate = null,Object? tripCost = null,Object? guests = null,Object? paymentMethod = null,Object? tripCreated = null,Object? hostId = freezed,Object? host = null,Object? cancelTrip = null,Object? cancelReason = null,Object? tripTotal = null,Object? upcoming = null,Object? rated = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,propertyId: null == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,property: null == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as PropertyDto,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,tripBeginDate: null == tripBeginDate ? _self.tripBeginDate : tripBeginDate // ignore: cast_nullable_to_non_nullable
as String,tripEndDate: null == tripEndDate ? _self.tripEndDate : tripEndDate // ignore: cast_nullable_to_non_nullable
as String,tripCost: null == tripCost ? _self.tripCost : tripCost // ignore: cast_nullable_to_non_nullable
as double,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,tripCreated: null == tripCreated ? _self.tripCreated : tripCreated // ignore: cast_nullable_to_non_nullable
as String,hostId: freezed == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as dynamic,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as UserDto,cancelTrip: null == cancelTrip ? _self.cancelTrip : cancelTrip // ignore: cast_nullable_to_non_nullable
as bool,cancelReason: null == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String,tripTotal: null == tripTotal ? _self.tripTotal : tripTotal // ignore: cast_nullable_to_non_nullable
as int,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as bool,rated: null == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PropertyDtoCopyWith<$Res> get property {
  
  return $PropertyDtoCopyWith<$Res>(_self.property, (value) {
    return _then(_self.copyWith(property: value));
  });
}/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get host {
  
  return $UserDtoCopyWith<$Res>(_self.host, (value) {
    return _then(_self.copyWith(host: value));
  });
}
}


/// Adds pattern-matching-related methods to [TripDto].
extension TripDtoPatterns on TripDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripDto value)  $default,){
final _that = this;
switch (_that) {
case _TripDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripDto value)?  $default,){
final _that = this;
switch (_that) {
case _TripDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int propertyId,  int userId,  PropertyDto property,  UserDto user,  String tripBeginDate,  String tripEndDate,  double tripCost,  int guests,  String paymentMethod,  String tripCreated,  dynamic hostId,  UserDto host,  bool cancelTrip,  String cancelReason,  int tripTotal,  bool upcoming,  bool rated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripDto() when $default != null:
return $default(_that.tripId,_that.propertyId,_that.userId,_that.property,_that.user,_that.tripBeginDate,_that.tripEndDate,_that.tripCost,_that.guests,_that.paymentMethod,_that.tripCreated,_that.hostId,_that.host,_that.cancelTrip,_that.cancelReason,_that.tripTotal,_that.upcoming,_that.rated);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int propertyId,  int userId,  PropertyDto property,  UserDto user,  String tripBeginDate,  String tripEndDate,  double tripCost,  int guests,  String paymentMethod,  String tripCreated,  dynamic hostId,  UserDto host,  bool cancelTrip,  String cancelReason,  int tripTotal,  bool upcoming,  bool rated)  $default,) {final _that = this;
switch (_that) {
case _TripDto():
return $default(_that.tripId,_that.propertyId,_that.userId,_that.property,_that.user,_that.tripBeginDate,_that.tripEndDate,_that.tripCost,_that.guests,_that.paymentMethod,_that.tripCreated,_that.hostId,_that.host,_that.cancelTrip,_that.cancelReason,_that.tripTotal,_that.upcoming,_that.rated);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int propertyId,  int userId,  PropertyDto property,  UserDto user,  String tripBeginDate,  String tripEndDate,  double tripCost,  int guests,  String paymentMethod,  String tripCreated,  dynamic hostId,  UserDto host,  bool cancelTrip,  String cancelReason,  int tripTotal,  bool upcoming,  bool rated)?  $default,) {final _that = this;
switch (_that) {
case _TripDto() when $default != null:
return $default(_that.tripId,_that.propertyId,_that.userId,_that.property,_that.user,_that.tripBeginDate,_that.tripEndDate,_that.tripCost,_that.guests,_that.paymentMethod,_that.tripCreated,_that.hostId,_that.host,_that.cancelTrip,_that.cancelReason,_that.tripTotal,_that.upcoming,_that.rated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripDto implements TripDto {
  const _TripDto({this.tripId = -1, this.propertyId = -1, this.userId = -1, this.property = const PropertyDto(), this.user = const UserDto(), this.tripBeginDate = '', this.tripEndDate = '', this.tripCost = 0.0, this.guests = -1, this.paymentMethod = '', this.tripCreated = '', this.hostId = -1, this.host = const UserDto(), this.cancelTrip = false, this.cancelReason = '', this.tripTotal = -1, this.upcoming = false, this.rated = false});
  factory _TripDto.fromJson(Map<String, dynamic> json) => _$TripDtoFromJson(json);

@override@JsonKey() final  int tripId;
@override@JsonKey() final  int propertyId;
@override@JsonKey() final  int userId;
@override@JsonKey() final  PropertyDto property;
@override@JsonKey() final  UserDto user;
@override@JsonKey() final  String tripBeginDate;
@override@JsonKey() final  String tripEndDate;
@override@JsonKey() final  double tripCost;
@override@JsonKey() final  int guests;
@override@JsonKey() final  String paymentMethod;
@override@JsonKey() final  String tripCreated;
@override@JsonKey() final  dynamic hostId;
@override@JsonKey() final  UserDto host;
@override@JsonKey() final  bool cancelTrip;
@override@JsonKey() final  String cancelReason;
@override@JsonKey() final  int tripTotal;
@override@JsonKey() final  bool upcoming;
@override@JsonKey() final  bool rated;

/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripDtoCopyWith<_TripDto> get copyWith => __$TripDtoCopyWithImpl<_TripDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripDto&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.property, property) || other.property == property)&&(identical(other.user, user) || other.user == user)&&(identical(other.tripBeginDate, tripBeginDate) || other.tripBeginDate == tripBeginDate)&&(identical(other.tripEndDate, tripEndDate) || other.tripEndDate == tripEndDate)&&(identical(other.tripCost, tripCost) || other.tripCost == tripCost)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.tripCreated, tripCreated) || other.tripCreated == tripCreated)&&const DeepCollectionEquality().equals(other.hostId, hostId)&&(identical(other.host, host) || other.host == host)&&(identical(other.cancelTrip, cancelTrip) || other.cancelTrip == cancelTrip)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.tripTotal, tripTotal) || other.tripTotal == tripTotal)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.rated, rated) || other.rated == rated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tripId,propertyId,userId,property,user,tripBeginDate,tripEndDate,tripCost,guests,paymentMethod,tripCreated,const DeepCollectionEquality().hash(hostId),host,cancelTrip,cancelReason,tripTotal,upcoming,rated);

@override
String toString() {
  return 'TripDto(tripId: $tripId, propertyId: $propertyId, userId: $userId, property: $property, user: $user, tripBeginDate: $tripBeginDate, tripEndDate: $tripEndDate, tripCost: $tripCost, guests: $guests, paymentMethod: $paymentMethod, tripCreated: $tripCreated, hostId: $hostId, host: $host, cancelTrip: $cancelTrip, cancelReason: $cancelReason, tripTotal: $tripTotal, upcoming: $upcoming, rated: $rated)';
}


}

/// @nodoc
abstract mixin class _$TripDtoCopyWith<$Res> implements $TripDtoCopyWith<$Res> {
  factory _$TripDtoCopyWith(_TripDto value, $Res Function(_TripDto) _then) = __$TripDtoCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int propertyId, int userId, PropertyDto property, UserDto user, String tripBeginDate, String tripEndDate, double tripCost, int guests, String paymentMethod, String tripCreated, dynamic hostId, UserDto host, bool cancelTrip, String cancelReason, int tripTotal, bool upcoming, bool rated
});


@override $PropertyDtoCopyWith<$Res> get property;@override $UserDtoCopyWith<$Res> get user;@override $UserDtoCopyWith<$Res> get host;

}
/// @nodoc
class __$TripDtoCopyWithImpl<$Res>
    implements _$TripDtoCopyWith<$Res> {
  __$TripDtoCopyWithImpl(this._self, this._then);

  final _TripDto _self;
  final $Res Function(_TripDto) _then;

/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? propertyId = null,Object? userId = null,Object? property = null,Object? user = null,Object? tripBeginDate = null,Object? tripEndDate = null,Object? tripCost = null,Object? guests = null,Object? paymentMethod = null,Object? tripCreated = null,Object? hostId = freezed,Object? host = null,Object? cancelTrip = null,Object? cancelReason = null,Object? tripTotal = null,Object? upcoming = null,Object? rated = null,}) {
  return _then(_TripDto(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,propertyId: null == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,property: null == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as PropertyDto,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,tripBeginDate: null == tripBeginDate ? _self.tripBeginDate : tripBeginDate // ignore: cast_nullable_to_non_nullable
as String,tripEndDate: null == tripEndDate ? _self.tripEndDate : tripEndDate // ignore: cast_nullable_to_non_nullable
as String,tripCost: null == tripCost ? _self.tripCost : tripCost // ignore: cast_nullable_to_non_nullable
as double,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,tripCreated: null == tripCreated ? _self.tripCreated : tripCreated // ignore: cast_nullable_to_non_nullable
as String,hostId: freezed == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as dynamic,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as UserDto,cancelTrip: null == cancelTrip ? _self.cancelTrip : cancelTrip // ignore: cast_nullable_to_non_nullable
as bool,cancelReason: null == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String,tripTotal: null == tripTotal ? _self.tripTotal : tripTotal // ignore: cast_nullable_to_non_nullable
as int,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as bool,rated: null == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PropertyDtoCopyWith<$Res> get property {
  
  return $PropertyDtoCopyWith<$Res>(_self.property, (value) {
    return _then(_self.copyWith(property: value));
  });
}/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get host {
  
  return $UserDtoCopyWith<$Res>(_self.host, (value) {
    return _then(_self.copyWith(host: value));
  });
}
}

// dart format on
