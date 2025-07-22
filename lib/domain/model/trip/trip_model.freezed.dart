// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TripModel {

 int? get tripId; int? get propertyId; int? get userId; PropertyModel? get property; UserModel? get user; String? get tripBeginDate; String? get tripEndDate; double? get tripCost; int? get guests; String? get paymentMethod; String? get tripCreated; int? get hostId; UserModel? get host; bool? get cancelTrip; String? get cancelReason; int? get tripTotal; bool? get upcoming; bool? get complete; bool? get rated;
/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripModelCopyWith<TripModel> get copyWith => _$TripModelCopyWithImpl<TripModel>(this as TripModel, _$identity);

  /// Serializes this TripModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripModel&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.property, property) || other.property == property)&&(identical(other.user, user) || other.user == user)&&(identical(other.tripBeginDate, tripBeginDate) || other.tripBeginDate == tripBeginDate)&&(identical(other.tripEndDate, tripEndDate) || other.tripEndDate == tripEndDate)&&(identical(other.tripCost, tripCost) || other.tripCost == tripCost)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.tripCreated, tripCreated) || other.tripCreated == tripCreated)&&(identical(other.hostId, hostId) || other.hostId == hostId)&&(identical(other.host, host) || other.host == host)&&(identical(other.cancelTrip, cancelTrip) || other.cancelTrip == cancelTrip)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.tripTotal, tripTotal) || other.tripTotal == tripTotal)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.complete, complete) || other.complete == complete)&&(identical(other.rated, rated) || other.rated == rated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,tripId,propertyId,userId,property,user,tripBeginDate,tripEndDate,tripCost,guests,paymentMethod,tripCreated,hostId,host,cancelTrip,cancelReason,tripTotal,upcoming,complete,rated]);

@override
String toString() {
  return 'TripModel(tripId: $tripId, propertyId: $propertyId, userId: $userId, property: $property, user: $user, tripBeginDate: $tripBeginDate, tripEndDate: $tripEndDate, tripCost: $tripCost, guests: $guests, paymentMethod: $paymentMethod, tripCreated: $tripCreated, hostId: $hostId, host: $host, cancelTrip: $cancelTrip, cancelReason: $cancelReason, tripTotal: $tripTotal, upcoming: $upcoming, complete: $complete, rated: $rated)';
}


}

/// @nodoc
abstract mixin class $TripModelCopyWith<$Res>  {
  factory $TripModelCopyWith(TripModel value, $Res Function(TripModel) _then) = _$TripModelCopyWithImpl;
@useResult
$Res call({
 int? tripId, int? propertyId, int? userId, PropertyModel? property, UserModel? user, String? tripBeginDate, String? tripEndDate, double? tripCost, int? guests, String? paymentMethod, String? tripCreated, int? hostId, UserModel? host, bool? cancelTrip, String? cancelReason, int? tripTotal, bool? upcoming, bool? complete, bool? rated
});


$PropertyModelCopyWith<$Res>? get property;$UserModelCopyWith<$Res>? get user;$UserModelCopyWith<$Res>? get host;

}
/// @nodoc
class _$TripModelCopyWithImpl<$Res>
    implements $TripModelCopyWith<$Res> {
  _$TripModelCopyWithImpl(this._self, this._then);

  final TripModel _self;
  final $Res Function(TripModel) _then;

/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = freezed,Object? propertyId = freezed,Object? userId = freezed,Object? property = freezed,Object? user = freezed,Object? tripBeginDate = freezed,Object? tripEndDate = freezed,Object? tripCost = freezed,Object? guests = freezed,Object? paymentMethod = freezed,Object? tripCreated = freezed,Object? hostId = freezed,Object? host = freezed,Object? cancelTrip = freezed,Object? cancelReason = freezed,Object? tripTotal = freezed,Object? upcoming = freezed,Object? complete = freezed,Object? rated = freezed,}) {
  return _then(_self.copyWith(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as PropertyModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,tripBeginDate: freezed == tripBeginDate ? _self.tripBeginDate : tripBeginDate // ignore: cast_nullable_to_non_nullable
as String?,tripEndDate: freezed == tripEndDate ? _self.tripEndDate : tripEndDate // ignore: cast_nullable_to_non_nullable
as String?,tripCost: freezed == tripCost ? _self.tripCost : tripCost // ignore: cast_nullable_to_non_nullable
as double?,guests: freezed == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,tripCreated: freezed == tripCreated ? _self.tripCreated : tripCreated // ignore: cast_nullable_to_non_nullable
as String?,hostId: freezed == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as int?,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as UserModel?,cancelTrip: freezed == cancelTrip ? _self.cancelTrip : cancelTrip // ignore: cast_nullable_to_non_nullable
as bool?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,tripTotal: freezed == tripTotal ? _self.tripTotal : tripTotal // ignore: cast_nullable_to_non_nullable
as int?,upcoming: freezed == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as bool?,complete: freezed == complete ? _self.complete : complete // ignore: cast_nullable_to_non_nullable
as bool?,rated: freezed == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PropertyModelCopyWith<$Res>? get property {
    if (_self.property == null) {
    return null;
  }

  return $PropertyModelCopyWith<$Res>(_self.property!, (value) {
    return _then(_self.copyWith(property: value));
  });
}/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get host {
    if (_self.host == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.host!, (value) {
    return _then(_self.copyWith(host: value));
  });
}
}


/// Adds pattern-matching-related methods to [TripModel].
extension TripModelPatterns on TripModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripModel value)  $default,){
final _that = this;
switch (_that) {
case _TripModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripModel value)?  $default,){
final _that = this;
switch (_that) {
case _TripModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tripId,  int? propertyId,  int? userId,  PropertyModel? property,  UserModel? user,  String? tripBeginDate,  String? tripEndDate,  double? tripCost,  int? guests,  String? paymentMethod,  String? tripCreated,  int? hostId,  UserModel? host,  bool? cancelTrip,  String? cancelReason,  int? tripTotal,  bool? upcoming,  bool? complete,  bool? rated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripModel() when $default != null:
return $default(_that.tripId,_that.propertyId,_that.userId,_that.property,_that.user,_that.tripBeginDate,_that.tripEndDate,_that.tripCost,_that.guests,_that.paymentMethod,_that.tripCreated,_that.hostId,_that.host,_that.cancelTrip,_that.cancelReason,_that.tripTotal,_that.upcoming,_that.complete,_that.rated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tripId,  int? propertyId,  int? userId,  PropertyModel? property,  UserModel? user,  String? tripBeginDate,  String? tripEndDate,  double? tripCost,  int? guests,  String? paymentMethod,  String? tripCreated,  int? hostId,  UserModel? host,  bool? cancelTrip,  String? cancelReason,  int? tripTotal,  bool? upcoming,  bool? complete,  bool? rated)  $default,) {final _that = this;
switch (_that) {
case _TripModel():
return $default(_that.tripId,_that.propertyId,_that.userId,_that.property,_that.user,_that.tripBeginDate,_that.tripEndDate,_that.tripCost,_that.guests,_that.paymentMethod,_that.tripCreated,_that.hostId,_that.host,_that.cancelTrip,_that.cancelReason,_that.tripTotal,_that.upcoming,_that.complete,_that.rated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tripId,  int? propertyId,  int? userId,  PropertyModel? property,  UserModel? user,  String? tripBeginDate,  String? tripEndDate,  double? tripCost,  int? guests,  String? paymentMethod,  String? tripCreated,  int? hostId,  UserModel? host,  bool? cancelTrip,  String? cancelReason,  int? tripTotal,  bool? upcoming,  bool? complete,  bool? rated)?  $default,) {final _that = this;
switch (_that) {
case _TripModel() when $default != null:
return $default(_that.tripId,_that.propertyId,_that.userId,_that.property,_that.user,_that.tripBeginDate,_that.tripEndDate,_that.tripCost,_that.guests,_that.paymentMethod,_that.tripCreated,_that.hostId,_that.host,_that.cancelTrip,_that.cancelReason,_that.tripTotal,_that.upcoming,_that.complete,_that.rated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripModel implements TripModel {
  const _TripModel({this.tripId, this.propertyId, this.userId, this.property, this.user, this.tripBeginDate, this.tripEndDate, this.tripCost, this.guests, this.paymentMethod, this.tripCreated, this.hostId, this.host, this.cancelTrip, this.cancelReason, this.tripTotal, this.upcoming, this.complete, this.rated});
  factory _TripModel.fromJson(Map<String, dynamic> json) => _$TripModelFromJson(json);

@override final  int? tripId;
@override final  int? propertyId;
@override final  int? userId;
@override final  PropertyModel? property;
@override final  UserModel? user;
@override final  String? tripBeginDate;
@override final  String? tripEndDate;
@override final  double? tripCost;
@override final  int? guests;
@override final  String? paymentMethod;
@override final  String? tripCreated;
@override final  int? hostId;
@override final  UserModel? host;
@override final  bool? cancelTrip;
@override final  String? cancelReason;
@override final  int? tripTotal;
@override final  bool? upcoming;
@override final  bool? complete;
@override final  bool? rated;

/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripModelCopyWith<_TripModel> get copyWith => __$TripModelCopyWithImpl<_TripModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripModel&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.property, property) || other.property == property)&&(identical(other.user, user) || other.user == user)&&(identical(other.tripBeginDate, tripBeginDate) || other.tripBeginDate == tripBeginDate)&&(identical(other.tripEndDate, tripEndDate) || other.tripEndDate == tripEndDate)&&(identical(other.tripCost, tripCost) || other.tripCost == tripCost)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.tripCreated, tripCreated) || other.tripCreated == tripCreated)&&(identical(other.hostId, hostId) || other.hostId == hostId)&&(identical(other.host, host) || other.host == host)&&(identical(other.cancelTrip, cancelTrip) || other.cancelTrip == cancelTrip)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.tripTotal, tripTotal) || other.tripTotal == tripTotal)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.complete, complete) || other.complete == complete)&&(identical(other.rated, rated) || other.rated == rated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,tripId,propertyId,userId,property,user,tripBeginDate,tripEndDate,tripCost,guests,paymentMethod,tripCreated,hostId,host,cancelTrip,cancelReason,tripTotal,upcoming,complete,rated]);

@override
String toString() {
  return 'TripModel(tripId: $tripId, propertyId: $propertyId, userId: $userId, property: $property, user: $user, tripBeginDate: $tripBeginDate, tripEndDate: $tripEndDate, tripCost: $tripCost, guests: $guests, paymentMethod: $paymentMethod, tripCreated: $tripCreated, hostId: $hostId, host: $host, cancelTrip: $cancelTrip, cancelReason: $cancelReason, tripTotal: $tripTotal, upcoming: $upcoming, complete: $complete, rated: $rated)';
}


}

/// @nodoc
abstract mixin class _$TripModelCopyWith<$Res> implements $TripModelCopyWith<$Res> {
  factory _$TripModelCopyWith(_TripModel value, $Res Function(_TripModel) _then) = __$TripModelCopyWithImpl;
@override @useResult
$Res call({
 int? tripId, int? propertyId, int? userId, PropertyModel? property, UserModel? user, String? tripBeginDate, String? tripEndDate, double? tripCost, int? guests, String? paymentMethod, String? tripCreated, int? hostId, UserModel? host, bool? cancelTrip, String? cancelReason, int? tripTotal, bool? upcoming, bool? complete, bool? rated
});


@override $PropertyModelCopyWith<$Res>? get property;@override $UserModelCopyWith<$Res>? get user;@override $UserModelCopyWith<$Res>? get host;

}
/// @nodoc
class __$TripModelCopyWithImpl<$Res>
    implements _$TripModelCopyWith<$Res> {
  __$TripModelCopyWithImpl(this._self, this._then);

  final _TripModel _self;
  final $Res Function(_TripModel) _then;

/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = freezed,Object? propertyId = freezed,Object? userId = freezed,Object? property = freezed,Object? user = freezed,Object? tripBeginDate = freezed,Object? tripEndDate = freezed,Object? tripCost = freezed,Object? guests = freezed,Object? paymentMethod = freezed,Object? tripCreated = freezed,Object? hostId = freezed,Object? host = freezed,Object? cancelTrip = freezed,Object? cancelReason = freezed,Object? tripTotal = freezed,Object? upcoming = freezed,Object? complete = freezed,Object? rated = freezed,}) {
  return _then(_TripModel(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as PropertyModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,tripBeginDate: freezed == tripBeginDate ? _self.tripBeginDate : tripBeginDate // ignore: cast_nullable_to_non_nullable
as String?,tripEndDate: freezed == tripEndDate ? _self.tripEndDate : tripEndDate // ignore: cast_nullable_to_non_nullable
as String?,tripCost: freezed == tripCost ? _self.tripCost : tripCost // ignore: cast_nullable_to_non_nullable
as double?,guests: freezed == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,tripCreated: freezed == tripCreated ? _self.tripCreated : tripCreated // ignore: cast_nullable_to_non_nullable
as String?,hostId: freezed == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as int?,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as UserModel?,cancelTrip: freezed == cancelTrip ? _self.cancelTrip : cancelTrip // ignore: cast_nullable_to_non_nullable
as bool?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,tripTotal: freezed == tripTotal ? _self.tripTotal : tripTotal // ignore: cast_nullable_to_non_nullable
as int?,upcoming: freezed == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as bool?,complete: freezed == complete ? _self.complete : complete // ignore: cast_nullable_to_non_nullable
as bool?,rated: freezed == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PropertyModelCopyWith<$Res>? get property {
    if (_self.property == null) {
    return null;
  }

  return $PropertyModelCopyWith<$Res>(_self.property!, (value) {
    return _then(_self.copyWith(property: value));
  });
}/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get host {
    if (_self.host == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.host!, (value) {
    return _then(_self.copyWith(host: value));
  });
}
}

// dart format on
