// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertyModel {

 String? get propertyId; String? get propertyName; String? get propertyDescription; String? get mainImage; String? get propertyLocation; String? get propertyAddress; bool? get isDraft; UserDto? get user; String? get propertyNeighborhood; double? get ratingSummary; int? get price; double? get taxRate; int? get cleaningFee; String? get notes; double? get minNightStay; String? get lastUpdated; int? get minNights; bool? get isLive;
/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyModelCopyWith<PropertyModel> get copyWith => _$PropertyModelCopyWithImpl<PropertyModel>(this as PropertyModel, _$identity);

  /// Serializes this PropertyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyModel&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyDescription, propertyDescription) || other.propertyDescription == propertyDescription)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.propertyLocation, propertyLocation) || other.propertyLocation == propertyLocation)&&(identical(other.propertyAddress, propertyAddress) || other.propertyAddress == propertyAddress)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.user, user) || other.user == user)&&(identical(other.propertyNeighborhood, propertyNeighborhood) || other.propertyNeighborhood == propertyNeighborhood)&&(identical(other.ratingSummary, ratingSummary) || other.ratingSummary == ratingSummary)&&(identical(other.price, price) || other.price == price)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.cleaningFee, cleaningFee) || other.cleaningFee == cleaningFee)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.minNightStay, minNightStay) || other.minNightStay == minNightStay)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyId,propertyName,propertyDescription,mainImage,propertyLocation,propertyAddress,isDraft,user,propertyNeighborhood,ratingSummary,price,taxRate,cleaningFee,notes,minNightStay,lastUpdated,minNights,isLive);

@override
String toString() {
  return 'PropertyModel(propertyId: $propertyId, propertyName: $propertyName, propertyDescription: $propertyDescription, mainImage: $mainImage, propertyLocation: $propertyLocation, propertyAddress: $propertyAddress, isDraft: $isDraft, user: $user, propertyNeighborhood: $propertyNeighborhood, ratingSummary: $ratingSummary, price: $price, taxRate: $taxRate, cleaningFee: $cleaningFee, notes: $notes, minNightStay: $minNightStay, lastUpdated: $lastUpdated, minNights: $minNights, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class $PropertyModelCopyWith<$Res>  {
  factory $PropertyModelCopyWith(PropertyModel value, $Res Function(PropertyModel) _then) = _$PropertyModelCopyWithImpl;
@useResult
$Res call({
 String? propertyId, String? propertyName, String? propertyDescription, String? mainImage, String? propertyLocation, String? propertyAddress, bool? isDraft, UserDto? user, String? propertyNeighborhood, double? ratingSummary, int? price, double? taxRate, int? cleaningFee, String? notes, double? minNightStay, String? lastUpdated, int? minNights, bool? isLive
});


$UserDtoCopyWith<$Res>? get user;

}
/// @nodoc
class _$PropertyModelCopyWithImpl<$Res>
    implements $PropertyModelCopyWith<$Res> {
  _$PropertyModelCopyWithImpl(this._self, this._then);

  final PropertyModel _self;
  final $Res Function(PropertyModel) _then;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? propertyId = freezed,Object? propertyName = freezed,Object? propertyDescription = freezed,Object? mainImage = freezed,Object? propertyLocation = freezed,Object? propertyAddress = freezed,Object? isDraft = freezed,Object? user = freezed,Object? propertyNeighborhood = freezed,Object? ratingSummary = freezed,Object? price = freezed,Object? taxRate = freezed,Object? cleaningFee = freezed,Object? notes = freezed,Object? minNightStay = freezed,Object? lastUpdated = freezed,Object? minNights = freezed,Object? isLive = freezed,}) {
  return _then(_self.copyWith(
propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,propertyDescription: freezed == propertyDescription ? _self.propertyDescription : propertyDescription // ignore: cast_nullable_to_non_nullable
as String?,mainImage: freezed == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String?,propertyLocation: freezed == propertyLocation ? _self.propertyLocation : propertyLocation // ignore: cast_nullable_to_non_nullable
as String?,propertyAddress: freezed == propertyAddress ? _self.propertyAddress : propertyAddress // ignore: cast_nullable_to_non_nullable
as String?,isDraft: freezed == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto?,propertyNeighborhood: freezed == propertyNeighborhood ? _self.propertyNeighborhood : propertyNeighborhood // ignore: cast_nullable_to_non_nullable
as String?,ratingSummary: freezed == ratingSummary ? _self.ratingSummary : ratingSummary // ignore: cast_nullable_to_non_nullable
as double?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double?,cleaningFee: freezed == cleaningFee ? _self.cleaningFee : cleaningFee // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,minNightStay: freezed == minNightStay ? _self.minNightStay : minNightStay // ignore: cast_nullable_to_non_nullable
as double?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,minNights: freezed == minNights ? _self.minNights : minNights // ignore: cast_nullable_to_non_nullable
as int?,isLive: freezed == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserDtoCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [PropertyModel].
extension PropertyModelPatterns on PropertyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyModel value)  $default,){
final _that = this;
switch (_that) {
case _PropertyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyModel value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? propertyId,  String? propertyName,  String? propertyDescription,  String? mainImage,  String? propertyLocation,  String? propertyAddress,  bool? isDraft,  UserDto? user,  String? propertyNeighborhood,  double? ratingSummary,  int? price,  double? taxRate,  int? cleaningFee,  String? notes,  double? minNightStay,  String? lastUpdated,  int? minNights,  bool? isLive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
return $default(_that.propertyId,_that.propertyName,_that.propertyDescription,_that.mainImage,_that.propertyLocation,_that.propertyAddress,_that.isDraft,_that.user,_that.propertyNeighborhood,_that.ratingSummary,_that.price,_that.taxRate,_that.cleaningFee,_that.notes,_that.minNightStay,_that.lastUpdated,_that.minNights,_that.isLive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? propertyId,  String? propertyName,  String? propertyDescription,  String? mainImage,  String? propertyLocation,  String? propertyAddress,  bool? isDraft,  UserDto? user,  String? propertyNeighborhood,  double? ratingSummary,  int? price,  double? taxRate,  int? cleaningFee,  String? notes,  double? minNightStay,  String? lastUpdated,  int? minNights,  bool? isLive)  $default,) {final _that = this;
switch (_that) {
case _PropertyModel():
return $default(_that.propertyId,_that.propertyName,_that.propertyDescription,_that.mainImage,_that.propertyLocation,_that.propertyAddress,_that.isDraft,_that.user,_that.propertyNeighborhood,_that.ratingSummary,_that.price,_that.taxRate,_that.cleaningFee,_that.notes,_that.minNightStay,_that.lastUpdated,_that.minNights,_that.isLive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? propertyId,  String? propertyName,  String? propertyDescription,  String? mainImage,  String? propertyLocation,  String? propertyAddress,  bool? isDraft,  UserDto? user,  String? propertyNeighborhood,  double? ratingSummary,  int? price,  double? taxRate,  int? cleaningFee,  String? notes,  double? minNightStay,  String? lastUpdated,  int? minNights,  bool? isLive)?  $default,) {final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
return $default(_that.propertyId,_that.propertyName,_that.propertyDescription,_that.mainImage,_that.propertyLocation,_that.propertyAddress,_that.isDraft,_that.user,_that.propertyNeighborhood,_that.ratingSummary,_that.price,_that.taxRate,_that.cleaningFee,_that.notes,_that.minNightStay,_that.lastUpdated,_that.minNights,_that.isLive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyModel implements PropertyModel {
  const _PropertyModel({this.propertyId, this.propertyName, this.propertyDescription, this.mainImage, this.propertyLocation, this.propertyAddress, this.isDraft, this.user, this.propertyNeighborhood, this.ratingSummary, this.price, this.taxRate, this.cleaningFee, this.notes, this.minNightStay, this.lastUpdated, this.minNights, this.isLive});
  factory _PropertyModel.fromJson(Map<String, dynamic> json) => _$PropertyModelFromJson(json);

@override final  String? propertyId;
@override final  String? propertyName;
@override final  String? propertyDescription;
@override final  String? mainImage;
@override final  String? propertyLocation;
@override final  String? propertyAddress;
@override final  bool? isDraft;
@override final  UserDto? user;
@override final  String? propertyNeighborhood;
@override final  double? ratingSummary;
@override final  int? price;
@override final  double? taxRate;
@override final  int? cleaningFee;
@override final  String? notes;
@override final  double? minNightStay;
@override final  String? lastUpdated;
@override final  int? minNights;
@override final  bool? isLive;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyModelCopyWith<_PropertyModel> get copyWith => __$PropertyModelCopyWithImpl<_PropertyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyModel&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyDescription, propertyDescription) || other.propertyDescription == propertyDescription)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.propertyLocation, propertyLocation) || other.propertyLocation == propertyLocation)&&(identical(other.propertyAddress, propertyAddress) || other.propertyAddress == propertyAddress)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.user, user) || other.user == user)&&(identical(other.propertyNeighborhood, propertyNeighborhood) || other.propertyNeighborhood == propertyNeighborhood)&&(identical(other.ratingSummary, ratingSummary) || other.ratingSummary == ratingSummary)&&(identical(other.price, price) || other.price == price)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.cleaningFee, cleaningFee) || other.cleaningFee == cleaningFee)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.minNightStay, minNightStay) || other.minNightStay == minNightStay)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyId,propertyName,propertyDescription,mainImage,propertyLocation,propertyAddress,isDraft,user,propertyNeighborhood,ratingSummary,price,taxRate,cleaningFee,notes,minNightStay,lastUpdated,minNights,isLive);

@override
String toString() {
  return 'PropertyModel(propertyId: $propertyId, propertyName: $propertyName, propertyDescription: $propertyDescription, mainImage: $mainImage, propertyLocation: $propertyLocation, propertyAddress: $propertyAddress, isDraft: $isDraft, user: $user, propertyNeighborhood: $propertyNeighborhood, ratingSummary: $ratingSummary, price: $price, taxRate: $taxRate, cleaningFee: $cleaningFee, notes: $notes, minNightStay: $minNightStay, lastUpdated: $lastUpdated, minNights: $minNights, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class _$PropertyModelCopyWith<$Res> implements $PropertyModelCopyWith<$Res> {
  factory _$PropertyModelCopyWith(_PropertyModel value, $Res Function(_PropertyModel) _then) = __$PropertyModelCopyWithImpl;
@override @useResult
$Res call({
 String? propertyId, String? propertyName, String? propertyDescription, String? mainImage, String? propertyLocation, String? propertyAddress, bool? isDraft, UserDto? user, String? propertyNeighborhood, double? ratingSummary, int? price, double? taxRate, int? cleaningFee, String? notes, double? minNightStay, String? lastUpdated, int? minNights, bool? isLive
});


@override $UserDtoCopyWith<$Res>? get user;

}
/// @nodoc
class __$PropertyModelCopyWithImpl<$Res>
    implements _$PropertyModelCopyWith<$Res> {
  __$PropertyModelCopyWithImpl(this._self, this._then);

  final _PropertyModel _self;
  final $Res Function(_PropertyModel) _then;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? propertyId = freezed,Object? propertyName = freezed,Object? propertyDescription = freezed,Object? mainImage = freezed,Object? propertyLocation = freezed,Object? propertyAddress = freezed,Object? isDraft = freezed,Object? user = freezed,Object? propertyNeighborhood = freezed,Object? ratingSummary = freezed,Object? price = freezed,Object? taxRate = freezed,Object? cleaningFee = freezed,Object? notes = freezed,Object? minNightStay = freezed,Object? lastUpdated = freezed,Object? minNights = freezed,Object? isLive = freezed,}) {
  return _then(_PropertyModel(
propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,propertyDescription: freezed == propertyDescription ? _self.propertyDescription : propertyDescription // ignore: cast_nullable_to_non_nullable
as String?,mainImage: freezed == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String?,propertyLocation: freezed == propertyLocation ? _self.propertyLocation : propertyLocation // ignore: cast_nullable_to_non_nullable
as String?,propertyAddress: freezed == propertyAddress ? _self.propertyAddress : propertyAddress // ignore: cast_nullable_to_non_nullable
as String?,isDraft: freezed == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto?,propertyNeighborhood: freezed == propertyNeighborhood ? _self.propertyNeighborhood : propertyNeighborhood // ignore: cast_nullable_to_non_nullable
as String?,ratingSummary: freezed == ratingSummary ? _self.ratingSummary : ratingSummary // ignore: cast_nullable_to_non_nullable
as double?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double?,cleaningFee: freezed == cleaningFee ? _self.cleaningFee : cleaningFee // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,minNightStay: freezed == minNightStay ? _self.minNightStay : minNightStay // ignore: cast_nullable_to_non_nullable
as double?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,minNights: freezed == minNights ? _self.minNights : minNights // ignore: cast_nullable_to_non_nullable
as int?,isLive: freezed == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserDtoCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
