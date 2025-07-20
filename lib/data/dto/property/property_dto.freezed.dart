// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertyDto {

 String get propertyName; String get propertyDescription; String get mainImage; String get propertyLocation; String get propertyAddress; bool get isDraft; UserDto get user; String get propertyNeighborhood; double get ratingSummary; int get price; double get taxRate; int get cleaningFee; String get notes; double get minNightStay; String get lastUpdated; int get minNights; bool get isLive;
/// Create a copy of PropertyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyDtoCopyWith<PropertyDto> get copyWith => _$PropertyDtoCopyWithImpl<PropertyDto>(this as PropertyDto, _$identity);

  /// Serializes this PropertyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyDto&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyDescription, propertyDescription) || other.propertyDescription == propertyDescription)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.propertyLocation, propertyLocation) || other.propertyLocation == propertyLocation)&&(identical(other.propertyAddress, propertyAddress) || other.propertyAddress == propertyAddress)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.user, user) || other.user == user)&&(identical(other.propertyNeighborhood, propertyNeighborhood) || other.propertyNeighborhood == propertyNeighborhood)&&(identical(other.ratingSummary, ratingSummary) || other.ratingSummary == ratingSummary)&&(identical(other.price, price) || other.price == price)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.cleaningFee, cleaningFee) || other.cleaningFee == cleaningFee)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.minNightStay, minNightStay) || other.minNightStay == minNightStay)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyName,propertyDescription,mainImage,propertyLocation,propertyAddress,isDraft,user,propertyNeighborhood,ratingSummary,price,taxRate,cleaningFee,notes,minNightStay,lastUpdated,minNights,isLive);

@override
String toString() {
  return 'PropertyDto(propertyName: $propertyName, propertyDescription: $propertyDescription, mainImage: $mainImage, propertyLocation: $propertyLocation, propertyAddress: $propertyAddress, isDraft: $isDraft, user: $user, propertyNeighborhood: $propertyNeighborhood, ratingSummary: $ratingSummary, price: $price, taxRate: $taxRate, cleaningFee: $cleaningFee, notes: $notes, minNightStay: $minNightStay, lastUpdated: $lastUpdated, minNights: $minNights, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class $PropertyDtoCopyWith<$Res>  {
  factory $PropertyDtoCopyWith(PropertyDto value, $Res Function(PropertyDto) _then) = _$PropertyDtoCopyWithImpl;
@useResult
$Res call({
 String propertyName, String propertyDescription, String mainImage, String propertyLocation, String propertyAddress, bool isDraft, UserDto user, String propertyNeighborhood, double ratingSummary, int price, double taxRate, int cleaningFee, String notes, double minNightStay, String lastUpdated, int minNights, bool isLive
});


$UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class _$PropertyDtoCopyWithImpl<$Res>
    implements $PropertyDtoCopyWith<$Res> {
  _$PropertyDtoCopyWithImpl(this._self, this._then);

  final PropertyDto _self;
  final $Res Function(PropertyDto) _then;

/// Create a copy of PropertyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? propertyName = null,Object? propertyDescription = null,Object? mainImage = null,Object? propertyLocation = null,Object? propertyAddress = null,Object? isDraft = null,Object? user = null,Object? propertyNeighborhood = null,Object? ratingSummary = null,Object? price = null,Object? taxRate = null,Object? cleaningFee = null,Object? notes = null,Object? minNightStay = null,Object? lastUpdated = null,Object? minNights = null,Object? isLive = null,}) {
  return _then(_self.copyWith(
propertyName: null == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String,propertyDescription: null == propertyDescription ? _self.propertyDescription : propertyDescription // ignore: cast_nullable_to_non_nullable
as String,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,propertyLocation: null == propertyLocation ? _self.propertyLocation : propertyLocation // ignore: cast_nullable_to_non_nullable
as String,propertyAddress: null == propertyAddress ? _self.propertyAddress : propertyAddress // ignore: cast_nullable_to_non_nullable
as String,isDraft: null == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,propertyNeighborhood: null == propertyNeighborhood ? _self.propertyNeighborhood : propertyNeighborhood // ignore: cast_nullable_to_non_nullable
as String,ratingSummary: null == ratingSummary ? _self.ratingSummary : ratingSummary // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double,cleaningFee: null == cleaningFee ? _self.cleaningFee : cleaningFee // ignore: cast_nullable_to_non_nullable
as int,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,minNightStay: null == minNightStay ? _self.minNightStay : minNightStay // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,minNights: null == minNights ? _self.minNights : minNights // ignore: cast_nullable_to_non_nullable
as int,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PropertyDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [PropertyDto].
extension PropertyDtoPatterns on PropertyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyDto value)  $default,){
final _that = this;
switch (_that) {
case _PropertyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyDto value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String propertyName,  String propertyDescription,  String mainImage,  String propertyLocation,  String propertyAddress,  bool isDraft,  UserDto user,  String propertyNeighborhood,  double ratingSummary,  int price,  double taxRate,  int cleaningFee,  String notes,  double minNightStay,  String lastUpdated,  int minNights,  bool isLive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyDto() when $default != null:
return $default(_that.propertyName,_that.propertyDescription,_that.mainImage,_that.propertyLocation,_that.propertyAddress,_that.isDraft,_that.user,_that.propertyNeighborhood,_that.ratingSummary,_that.price,_that.taxRate,_that.cleaningFee,_that.notes,_that.minNightStay,_that.lastUpdated,_that.minNights,_that.isLive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String propertyName,  String propertyDescription,  String mainImage,  String propertyLocation,  String propertyAddress,  bool isDraft,  UserDto user,  String propertyNeighborhood,  double ratingSummary,  int price,  double taxRate,  int cleaningFee,  String notes,  double minNightStay,  String lastUpdated,  int minNights,  bool isLive)  $default,) {final _that = this;
switch (_that) {
case _PropertyDto():
return $default(_that.propertyName,_that.propertyDescription,_that.mainImage,_that.propertyLocation,_that.propertyAddress,_that.isDraft,_that.user,_that.propertyNeighborhood,_that.ratingSummary,_that.price,_that.taxRate,_that.cleaningFee,_that.notes,_that.minNightStay,_that.lastUpdated,_that.minNights,_that.isLive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String propertyName,  String propertyDescription,  String mainImage,  String propertyLocation,  String propertyAddress,  bool isDraft,  UserDto user,  String propertyNeighborhood,  double ratingSummary,  int price,  double taxRate,  int cleaningFee,  String notes,  double minNightStay,  String lastUpdated,  int minNights,  bool isLive)?  $default,) {final _that = this;
switch (_that) {
case _PropertyDto() when $default != null:
return $default(_that.propertyName,_that.propertyDescription,_that.mainImage,_that.propertyLocation,_that.propertyAddress,_that.isDraft,_that.user,_that.propertyNeighborhood,_that.ratingSummary,_that.price,_that.taxRate,_that.cleaningFee,_that.notes,_that.minNightStay,_that.lastUpdated,_that.minNights,_that.isLive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyDto implements PropertyDto {
  const _PropertyDto({this.propertyName = '', this.propertyDescription = '', this.mainImage = '', this.propertyLocation = '', this.propertyAddress = '', this.isDraft = false, this.user = const UserDto(), this.propertyNeighborhood = '', this.ratingSummary = 0.0, this.price = -1, this.taxRate = 0.0, this.cleaningFee = -1, this.notes = '', this.minNightStay = 0.0, this.lastUpdated = '', this.minNights = -1, this.isLive = false});
  factory _PropertyDto.fromJson(Map<String, dynamic> json) => _$PropertyDtoFromJson(json);

@override@JsonKey() final  String propertyName;
@override@JsonKey() final  String propertyDescription;
@override@JsonKey() final  String mainImage;
@override@JsonKey() final  String propertyLocation;
@override@JsonKey() final  String propertyAddress;
@override@JsonKey() final  bool isDraft;
@override@JsonKey() final  UserDto user;
@override@JsonKey() final  String propertyNeighborhood;
@override@JsonKey() final  double ratingSummary;
@override@JsonKey() final  int price;
@override@JsonKey() final  double taxRate;
@override@JsonKey() final  int cleaningFee;
@override@JsonKey() final  String notes;
@override@JsonKey() final  double minNightStay;
@override@JsonKey() final  String lastUpdated;
@override@JsonKey() final  int minNights;
@override@JsonKey() final  bool isLive;

/// Create a copy of PropertyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyDtoCopyWith<_PropertyDto> get copyWith => __$PropertyDtoCopyWithImpl<_PropertyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyDto&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyDescription, propertyDescription) || other.propertyDescription == propertyDescription)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.propertyLocation, propertyLocation) || other.propertyLocation == propertyLocation)&&(identical(other.propertyAddress, propertyAddress) || other.propertyAddress == propertyAddress)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.user, user) || other.user == user)&&(identical(other.propertyNeighborhood, propertyNeighborhood) || other.propertyNeighborhood == propertyNeighborhood)&&(identical(other.ratingSummary, ratingSummary) || other.ratingSummary == ratingSummary)&&(identical(other.price, price) || other.price == price)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.cleaningFee, cleaningFee) || other.cleaningFee == cleaningFee)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.minNightStay, minNightStay) || other.minNightStay == minNightStay)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyName,propertyDescription,mainImage,propertyLocation,propertyAddress,isDraft,user,propertyNeighborhood,ratingSummary,price,taxRate,cleaningFee,notes,minNightStay,lastUpdated,minNights,isLive);

@override
String toString() {
  return 'PropertyDto(propertyName: $propertyName, propertyDescription: $propertyDescription, mainImage: $mainImage, propertyLocation: $propertyLocation, propertyAddress: $propertyAddress, isDraft: $isDraft, user: $user, propertyNeighborhood: $propertyNeighborhood, ratingSummary: $ratingSummary, price: $price, taxRate: $taxRate, cleaningFee: $cleaningFee, notes: $notes, minNightStay: $minNightStay, lastUpdated: $lastUpdated, minNights: $minNights, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class _$PropertyDtoCopyWith<$Res> implements $PropertyDtoCopyWith<$Res> {
  factory _$PropertyDtoCopyWith(_PropertyDto value, $Res Function(_PropertyDto) _then) = __$PropertyDtoCopyWithImpl;
@override @useResult
$Res call({
 String propertyName, String propertyDescription, String mainImage, String propertyLocation, String propertyAddress, bool isDraft, UserDto user, String propertyNeighborhood, double ratingSummary, int price, double taxRate, int cleaningFee, String notes, double minNightStay, String lastUpdated, int minNights, bool isLive
});


@override $UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class __$PropertyDtoCopyWithImpl<$Res>
    implements _$PropertyDtoCopyWith<$Res> {
  __$PropertyDtoCopyWithImpl(this._self, this._then);

  final _PropertyDto _self;
  final $Res Function(_PropertyDto) _then;

/// Create a copy of PropertyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? propertyName = null,Object? propertyDescription = null,Object? mainImage = null,Object? propertyLocation = null,Object? propertyAddress = null,Object? isDraft = null,Object? user = null,Object? propertyNeighborhood = null,Object? ratingSummary = null,Object? price = null,Object? taxRate = null,Object? cleaningFee = null,Object? notes = null,Object? minNightStay = null,Object? lastUpdated = null,Object? minNights = null,Object? isLive = null,}) {
  return _then(_PropertyDto(
propertyName: null == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String,propertyDescription: null == propertyDescription ? _self.propertyDescription : propertyDescription // ignore: cast_nullable_to_non_nullable
as String,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,propertyLocation: null == propertyLocation ? _self.propertyLocation : propertyLocation // ignore: cast_nullable_to_non_nullable
as String,propertyAddress: null == propertyAddress ? _self.propertyAddress : propertyAddress // ignore: cast_nullable_to_non_nullable
as String,isDraft: null == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,propertyNeighborhood: null == propertyNeighborhood ? _self.propertyNeighborhood : propertyNeighborhood // ignore: cast_nullable_to_non_nullable
as String,ratingSummary: null == ratingSummary ? _self.ratingSummary : ratingSummary // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double,cleaningFee: null == cleaningFee ? _self.cleaningFee : cleaningFee // ignore: cast_nullable_to_non_nullable
as int,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,minNightStay: null == minNightStay ? _self.minNightStay : minNightStay // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,minNights: null == minNights ? _self.minNights : minNights // ignore: cast_nullable_to_non_nullable
as int,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PropertyDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
