// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amenity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AmenityModel {

 bool? get ac; bool? get heater; bool? get pool; bool? get dogFriendly; bool? get washer; bool? get dryer; bool? get workOut; bool? get hip; bool? get nightLife; bool? get extraOutlets; bool? get evCharger;
/// Create a copy of AmenityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmenityModelCopyWith<AmenityModel> get copyWith => _$AmenityModelCopyWithImpl<AmenityModel>(this as AmenityModel, _$identity);

  /// Serializes this AmenityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmenityModel&&(identical(other.ac, ac) || other.ac == ac)&&(identical(other.heater, heater) || other.heater == heater)&&(identical(other.pool, pool) || other.pool == pool)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.washer, washer) || other.washer == washer)&&(identical(other.dryer, dryer) || other.dryer == dryer)&&(identical(other.workOut, workOut) || other.workOut == workOut)&&(identical(other.hip, hip) || other.hip == hip)&&(identical(other.nightLife, nightLife) || other.nightLife == nightLife)&&(identical(other.extraOutlets, extraOutlets) || other.extraOutlets == extraOutlets)&&(identical(other.evCharger, evCharger) || other.evCharger == evCharger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ac,heater,pool,dogFriendly,washer,dryer,workOut,hip,nightLife,extraOutlets,evCharger);

@override
String toString() {
  return 'AmenityModel(ac: $ac, heater: $heater, pool: $pool, dogFriendly: $dogFriendly, washer: $washer, dryer: $dryer, workOut: $workOut, hip: $hip, nightLife: $nightLife, extraOutlets: $extraOutlets, evCharger: $evCharger)';
}


}

/// @nodoc
abstract mixin class $AmenityModelCopyWith<$Res>  {
  factory $AmenityModelCopyWith(AmenityModel value, $Res Function(AmenityModel) _then) = _$AmenityModelCopyWithImpl;
@useResult
$Res call({
 bool? ac, bool? heater, bool? pool, bool? dogFriendly, bool? washer, bool? dryer, bool? workOut, bool? hip, bool? nightLife, bool? extraOutlets, bool? evCharger
});




}
/// @nodoc
class _$AmenityModelCopyWithImpl<$Res>
    implements $AmenityModelCopyWith<$Res> {
  _$AmenityModelCopyWithImpl(this._self, this._then);

  final AmenityModel _self;
  final $Res Function(AmenityModel) _then;

/// Create a copy of AmenityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ac = freezed,Object? heater = freezed,Object? pool = freezed,Object? dogFriendly = freezed,Object? washer = freezed,Object? dryer = freezed,Object? workOut = freezed,Object? hip = freezed,Object? nightLife = freezed,Object? extraOutlets = freezed,Object? evCharger = freezed,}) {
  return _then(_self.copyWith(
ac: freezed == ac ? _self.ac : ac // ignore: cast_nullable_to_non_nullable
as bool?,heater: freezed == heater ? _self.heater : heater // ignore: cast_nullable_to_non_nullable
as bool?,pool: freezed == pool ? _self.pool : pool // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,washer: freezed == washer ? _self.washer : washer // ignore: cast_nullable_to_non_nullable
as bool?,dryer: freezed == dryer ? _self.dryer : dryer // ignore: cast_nullable_to_non_nullable
as bool?,workOut: freezed == workOut ? _self.workOut : workOut // ignore: cast_nullable_to_non_nullable
as bool?,hip: freezed == hip ? _self.hip : hip // ignore: cast_nullable_to_non_nullable
as bool?,nightLife: freezed == nightLife ? _self.nightLife : nightLife // ignore: cast_nullable_to_non_nullable
as bool?,extraOutlets: freezed == extraOutlets ? _self.extraOutlets : extraOutlets // ignore: cast_nullable_to_non_nullable
as bool?,evCharger: freezed == evCharger ? _self.evCharger : evCharger // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AmenityModel].
extension AmenityModelPatterns on AmenityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmenityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmenityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmenityModel value)  $default,){
final _that = this;
switch (_that) {
case _AmenityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmenityModel value)?  $default,){
final _that = this;
switch (_that) {
case _AmenityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? ac,  bool? heater,  bool? pool,  bool? dogFriendly,  bool? washer,  bool? dryer,  bool? workOut,  bool? hip,  bool? nightLife,  bool? extraOutlets,  bool? evCharger)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmenityModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? ac,  bool? heater,  bool? pool,  bool? dogFriendly,  bool? washer,  bool? dryer,  bool? workOut,  bool? hip,  bool? nightLife,  bool? extraOutlets,  bool? evCharger)  $default,) {final _that = this;
switch (_that) {
case _AmenityModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? ac,  bool? heater,  bool? pool,  bool? dogFriendly,  bool? washer,  bool? dryer,  bool? workOut,  bool? hip,  bool? nightLife,  bool? extraOutlets,  bool? evCharger)?  $default,) {final _that = this;
switch (_that) {
case _AmenityModel() when $default != null:
return $default(_that.ac,_that.heater,_that.pool,_that.dogFriendly,_that.washer,_that.dryer,_that.workOut,_that.hip,_that.nightLife,_that.extraOutlets,_that.evCharger);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AmenityModel implements AmenityModel {
  const _AmenityModel({this.ac, this.heater, this.pool, this.dogFriendly, this.washer, this.dryer, this.workOut, this.hip, this.nightLife, this.extraOutlets, this.evCharger});
  factory _AmenityModel.fromJson(Map<String, dynamic> json) => _$AmenityModelFromJson(json);

@override final  bool? ac;
@override final  bool? heater;
@override final  bool? pool;
@override final  bool? dogFriendly;
@override final  bool? washer;
@override final  bool? dryer;
@override final  bool? workOut;
@override final  bool? hip;
@override final  bool? nightLife;
@override final  bool? extraOutlets;
@override final  bool? evCharger;

/// Create a copy of AmenityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmenityModelCopyWith<_AmenityModel> get copyWith => __$AmenityModelCopyWithImpl<_AmenityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmenityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmenityModel&&(identical(other.ac, ac) || other.ac == ac)&&(identical(other.heater, heater) || other.heater == heater)&&(identical(other.pool, pool) || other.pool == pool)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.washer, washer) || other.washer == washer)&&(identical(other.dryer, dryer) || other.dryer == dryer)&&(identical(other.workOut, workOut) || other.workOut == workOut)&&(identical(other.hip, hip) || other.hip == hip)&&(identical(other.nightLife, nightLife) || other.nightLife == nightLife)&&(identical(other.extraOutlets, extraOutlets) || other.extraOutlets == extraOutlets)&&(identical(other.evCharger, evCharger) || other.evCharger == evCharger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ac,heater,pool,dogFriendly,washer,dryer,workOut,hip,nightLife,extraOutlets,evCharger);

@override
String toString() {
  return 'AmenityModel(ac: $ac, heater: $heater, pool: $pool, dogFriendly: $dogFriendly, washer: $washer, dryer: $dryer, workOut: $workOut, hip: $hip, nightLife: $nightLife, extraOutlets: $extraOutlets, evCharger: $evCharger)';
}


}

/// @nodoc
abstract mixin class _$AmenityModelCopyWith<$Res> implements $AmenityModelCopyWith<$Res> {
  factory _$AmenityModelCopyWith(_AmenityModel value, $Res Function(_AmenityModel) _then) = __$AmenityModelCopyWithImpl;
@override @useResult
$Res call({
 bool? ac, bool? heater, bool? pool, bool? dogFriendly, bool? washer, bool? dryer, bool? workOut, bool? hip, bool? nightLife, bool? extraOutlets, bool? evCharger
});




}
/// @nodoc
class __$AmenityModelCopyWithImpl<$Res>
    implements _$AmenityModelCopyWith<$Res> {
  __$AmenityModelCopyWithImpl(this._self, this._then);

  final _AmenityModel _self;
  final $Res Function(_AmenityModel) _then;

/// Create a copy of AmenityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ac = freezed,Object? heater = freezed,Object? pool = freezed,Object? dogFriendly = freezed,Object? washer = freezed,Object? dryer = freezed,Object? workOut = freezed,Object? hip = freezed,Object? nightLife = freezed,Object? extraOutlets = freezed,Object? evCharger = freezed,}) {
  return _then(_AmenityModel(
ac: freezed == ac ? _self.ac : ac // ignore: cast_nullable_to_non_nullable
as bool?,heater: freezed == heater ? _self.heater : heater // ignore: cast_nullable_to_non_nullable
as bool?,pool: freezed == pool ? _self.pool : pool // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,washer: freezed == washer ? _self.washer : washer // ignore: cast_nullable_to_non_nullable
as bool?,dryer: freezed == dryer ? _self.dryer : dryer // ignore: cast_nullable_to_non_nullable
as bool?,workOut: freezed == workOut ? _self.workOut : workOut // ignore: cast_nullable_to_non_nullable
as bool?,hip: freezed == hip ? _self.hip : hip // ignore: cast_nullable_to_non_nullable
as bool?,nightLife: freezed == nightLife ? _self.nightLife : nightLife // ignore: cast_nullable_to_non_nullable
as bool?,extraOutlets: freezed == extraOutlets ? _self.extraOutlets : extraOutlets // ignore: cast_nullable_to_non_nullable
as bool?,evCharger: freezed == evCharger ? _self.evCharger : evCharger // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
