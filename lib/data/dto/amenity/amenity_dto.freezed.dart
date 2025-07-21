// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amenity_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AmenityDto {

 bool get ac; bool get heater; bool get pool; bool get dogFriendly; bool get washer; bool get dryer; bool get workOut; bool get hip; bool get nightLife; bool get extraOutlets; bool get evCharger;
/// Create a copy of AmenityDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmenityDtoCopyWith<AmenityDto> get copyWith => _$AmenityDtoCopyWithImpl<AmenityDto>(this as AmenityDto, _$identity);

  /// Serializes this AmenityDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmenityDto&&(identical(other.ac, ac) || other.ac == ac)&&(identical(other.heater, heater) || other.heater == heater)&&(identical(other.pool, pool) || other.pool == pool)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.washer, washer) || other.washer == washer)&&(identical(other.dryer, dryer) || other.dryer == dryer)&&(identical(other.workOut, workOut) || other.workOut == workOut)&&(identical(other.hip, hip) || other.hip == hip)&&(identical(other.nightLife, nightLife) || other.nightLife == nightLife)&&(identical(other.extraOutlets, extraOutlets) || other.extraOutlets == extraOutlets)&&(identical(other.evCharger, evCharger) || other.evCharger == evCharger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ac,heater,pool,dogFriendly,washer,dryer,workOut,hip,nightLife,extraOutlets,evCharger);

@override
String toString() {
  return 'AmenityDto(ac: $ac, heater: $heater, pool: $pool, dogFriendly: $dogFriendly, washer: $washer, dryer: $dryer, workOut: $workOut, hip: $hip, nightLife: $nightLife, extraOutlets: $extraOutlets, evCharger: $evCharger)';
}


}

/// @nodoc
abstract mixin class $AmenityDtoCopyWith<$Res>  {
  factory $AmenityDtoCopyWith(AmenityDto value, $Res Function(AmenityDto) _then) = _$AmenityDtoCopyWithImpl;
@useResult
$Res call({
 bool ac, bool heater, bool pool, bool dogFriendly, bool washer, bool dryer, bool workOut, bool hip, bool nightLife, bool extraOutlets, bool evCharger
});




}
/// @nodoc
class _$AmenityDtoCopyWithImpl<$Res>
    implements $AmenityDtoCopyWith<$Res> {
  _$AmenityDtoCopyWithImpl(this._self, this._then);

  final AmenityDto _self;
  final $Res Function(AmenityDto) _then;

/// Create a copy of AmenityDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ac = null,Object? heater = null,Object? pool = null,Object? dogFriendly = null,Object? washer = null,Object? dryer = null,Object? workOut = null,Object? hip = null,Object? nightLife = null,Object? extraOutlets = null,Object? evCharger = null,}) {
  return _then(_self.copyWith(
ac: null == ac ? _self.ac : ac // ignore: cast_nullable_to_non_nullable
as bool,heater: null == heater ? _self.heater : heater // ignore: cast_nullable_to_non_nullable
as bool,pool: null == pool ? _self.pool : pool // ignore: cast_nullable_to_non_nullable
as bool,dogFriendly: null == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool,washer: null == washer ? _self.washer : washer // ignore: cast_nullable_to_non_nullable
as bool,dryer: null == dryer ? _self.dryer : dryer // ignore: cast_nullable_to_non_nullable
as bool,workOut: null == workOut ? _self.workOut : workOut // ignore: cast_nullable_to_non_nullable
as bool,hip: null == hip ? _self.hip : hip // ignore: cast_nullable_to_non_nullable
as bool,nightLife: null == nightLife ? _self.nightLife : nightLife // ignore: cast_nullable_to_non_nullable
as bool,extraOutlets: null == extraOutlets ? _self.extraOutlets : extraOutlets // ignore: cast_nullable_to_non_nullable
as bool,evCharger: null == evCharger ? _self.evCharger : evCharger // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AmenityDto].
extension AmenityDtoPatterns on AmenityDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmenityDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmenityDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmenityDto value)  $default,){
final _that = this;
switch (_that) {
case _AmenityDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmenityDto value)?  $default,){
final _that = this;
switch (_that) {
case _AmenityDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ac,  bool heater,  bool pool,  bool dogFriendly,  bool washer,  bool dryer,  bool workOut,  bool hip,  bool nightLife,  bool extraOutlets,  bool evCharger)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmenityDto() when $default != null:
return $default(_that.ac,_that.heater,_that.pool,_that.dogFriendly,_that.washer,_that.dryer,_that.workOut,_that.hip,_that.nightLife,_that.extraOutlets,_that.evCharger);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ac,  bool heater,  bool pool,  bool dogFriendly,  bool washer,  bool dryer,  bool workOut,  bool hip,  bool nightLife,  bool extraOutlets,  bool evCharger)  $default,) {final _that = this;
switch (_that) {
case _AmenityDto():
return $default(_that.ac,_that.heater,_that.pool,_that.dogFriendly,_that.washer,_that.dryer,_that.workOut,_that.hip,_that.nightLife,_that.extraOutlets,_that.evCharger);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ac,  bool heater,  bool pool,  bool dogFriendly,  bool washer,  bool dryer,  bool workOut,  bool hip,  bool nightLife,  bool extraOutlets,  bool evCharger)?  $default,) {final _that = this;
switch (_that) {
case _AmenityDto() when $default != null:
return $default(_that.ac,_that.heater,_that.pool,_that.dogFriendly,_that.washer,_that.dryer,_that.workOut,_that.hip,_that.nightLife,_that.extraOutlets,_that.evCharger);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AmenityDto implements AmenityDto {
  const _AmenityDto({this.ac = false, this.heater = false, this.pool = false, this.dogFriendly = false, this.washer = false, this.dryer = false, this.workOut = false, this.hip = false, this.nightLife = false, this.extraOutlets = false, this.evCharger = false});
  factory _AmenityDto.fromJson(Map<String, dynamic> json) => _$AmenityDtoFromJson(json);

@override@JsonKey() final  bool ac;
@override@JsonKey() final  bool heater;
@override@JsonKey() final  bool pool;
@override@JsonKey() final  bool dogFriendly;
@override@JsonKey() final  bool washer;
@override@JsonKey() final  bool dryer;
@override@JsonKey() final  bool workOut;
@override@JsonKey() final  bool hip;
@override@JsonKey() final  bool nightLife;
@override@JsonKey() final  bool extraOutlets;
@override@JsonKey() final  bool evCharger;

/// Create a copy of AmenityDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmenityDtoCopyWith<_AmenityDto> get copyWith => __$AmenityDtoCopyWithImpl<_AmenityDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmenityDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmenityDto&&(identical(other.ac, ac) || other.ac == ac)&&(identical(other.heater, heater) || other.heater == heater)&&(identical(other.pool, pool) || other.pool == pool)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.washer, washer) || other.washer == washer)&&(identical(other.dryer, dryer) || other.dryer == dryer)&&(identical(other.workOut, workOut) || other.workOut == workOut)&&(identical(other.hip, hip) || other.hip == hip)&&(identical(other.nightLife, nightLife) || other.nightLife == nightLife)&&(identical(other.extraOutlets, extraOutlets) || other.extraOutlets == extraOutlets)&&(identical(other.evCharger, evCharger) || other.evCharger == evCharger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ac,heater,pool,dogFriendly,washer,dryer,workOut,hip,nightLife,extraOutlets,evCharger);

@override
String toString() {
  return 'AmenityDto(ac: $ac, heater: $heater, pool: $pool, dogFriendly: $dogFriendly, washer: $washer, dryer: $dryer, workOut: $workOut, hip: $hip, nightLife: $nightLife, extraOutlets: $extraOutlets, evCharger: $evCharger)';
}


}

/// @nodoc
abstract mixin class _$AmenityDtoCopyWith<$Res> implements $AmenityDtoCopyWith<$Res> {
  factory _$AmenityDtoCopyWith(_AmenityDto value, $Res Function(_AmenityDto) _then) = __$AmenityDtoCopyWithImpl;
@override @useResult
$Res call({
 bool ac, bool heater, bool pool, bool dogFriendly, bool washer, bool dryer, bool workOut, bool hip, bool nightLife, bool extraOutlets, bool evCharger
});




}
/// @nodoc
class __$AmenityDtoCopyWithImpl<$Res>
    implements _$AmenityDtoCopyWith<$Res> {
  __$AmenityDtoCopyWithImpl(this._self, this._then);

  final _AmenityDto _self;
  final $Res Function(_AmenityDto) _then;

/// Create a copy of AmenityDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ac = null,Object? heater = null,Object? pool = null,Object? dogFriendly = null,Object? washer = null,Object? dryer = null,Object? workOut = null,Object? hip = null,Object? nightLife = null,Object? extraOutlets = null,Object? evCharger = null,}) {
  return _then(_AmenityDto(
ac: null == ac ? _self.ac : ac // ignore: cast_nullable_to_non_nullable
as bool,heater: null == heater ? _self.heater : heater // ignore: cast_nullable_to_non_nullable
as bool,pool: null == pool ? _self.pool : pool // ignore: cast_nullable_to_non_nullable
as bool,dogFriendly: null == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool,washer: null == washer ? _self.washer : washer // ignore: cast_nullable_to_non_nullable
as bool,dryer: null == dryer ? _self.dryer : dryer // ignore: cast_nullable_to_non_nullable
as bool,workOut: null == workOut ? _self.workOut : workOut // ignore: cast_nullable_to_non_nullable
as bool,hip: null == hip ? _self.hip : hip // ignore: cast_nullable_to_non_nullable
as bool,nightLife: null == nightLife ? _self.nightLife : nightLife // ignore: cast_nullable_to_non_nullable
as bool,extraOutlets: null == extraOutlets ? _self.extraOutlets : extraOutlets // ignore: cast_nullable_to_non_nullable
as bool,evCharger: null == evCharger ? _self.evCharger : evCharger // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
