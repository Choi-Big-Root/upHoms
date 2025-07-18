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

 String get propertyName; String get propertyDescription; String get mainImage; String get propertyAddress; bool get isDraft; UserModel get userRef; String get propertyNeighborhood; double get ratingSummary; int get price; double get taxRate; int get cleaningFee; String get notes; double get minNightStay; String get lastUpdated; int get minNights; bool get isLive;
/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyModelCopyWith<PropertyModel> get copyWith => _$PropertyModelCopyWithImpl<PropertyModel>(this as PropertyModel, _$identity);

  /// Serializes this PropertyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyModel&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyDescription, propertyDescription) || other.propertyDescription == propertyDescription)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.propertyAddress, propertyAddress) || other.propertyAddress == propertyAddress)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.userRef, userRef) || other.userRef == userRef)&&(identical(other.propertyNeighborhood, propertyNeighborhood) || other.propertyNeighborhood == propertyNeighborhood)&&(identical(other.ratingSummary, ratingSummary) || other.ratingSummary == ratingSummary)&&(identical(other.price, price) || other.price == price)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.cleaningFee, cleaningFee) || other.cleaningFee == cleaningFee)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.minNightStay, minNightStay) || other.minNightStay == minNightStay)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyName,propertyDescription,mainImage,propertyAddress,isDraft,userRef,propertyNeighborhood,ratingSummary,price,taxRate,cleaningFee,notes,minNightStay,lastUpdated,minNights,isLive);

@override
String toString() {
  return 'PropertyModel(propertyName: $propertyName, propertyDescription: $propertyDescription, mainImage: $mainImage, propertyAddress: $propertyAddress, isDraft: $isDraft, userRef: $userRef, propertyNeighborhood: $propertyNeighborhood, ratingSummary: $ratingSummary, price: $price, taxRate: $taxRate, cleaningFee: $cleaningFee, notes: $notes, minNightStay: $minNightStay, lastUpdated: $lastUpdated, minNights: $minNights, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class $PropertyModelCopyWith<$Res>  {
  factory $PropertyModelCopyWith(PropertyModel value, $Res Function(PropertyModel) _then) = _$PropertyModelCopyWithImpl;
@useResult
$Res call({
 String propertyName, String propertyDescription, String mainImage, String propertyAddress, bool isDraft, UserModel userRef, String propertyNeighborhood, double ratingSummary, int price, double taxRate, int cleaningFee, String notes, double minNightStay, String lastUpdated, int minNights, bool isLive
});


$UserModelCopyWith<$Res> get userRef;

}
/// @nodoc
class _$PropertyModelCopyWithImpl<$Res>
    implements $PropertyModelCopyWith<$Res> {
  _$PropertyModelCopyWithImpl(this._self, this._then);

  final PropertyModel _self;
  final $Res Function(PropertyModel) _then;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? propertyName = null,Object? propertyDescription = null,Object? mainImage = null,Object? propertyAddress = null,Object? isDraft = null,Object? userRef = null,Object? propertyNeighborhood = null,Object? ratingSummary = null,Object? price = null,Object? taxRate = null,Object? cleaningFee = null,Object? notes = null,Object? minNightStay = null,Object? lastUpdated = null,Object? minNights = null,Object? isLive = null,}) {
  return _then(_self.copyWith(
propertyName: null == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String,propertyDescription: null == propertyDescription ? _self.propertyDescription : propertyDescription // ignore: cast_nullable_to_non_nullable
as String,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,propertyAddress: null == propertyAddress ? _self.propertyAddress : propertyAddress // ignore: cast_nullable_to_non_nullable
as String,isDraft: null == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool,userRef: null == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as UserModel,propertyNeighborhood: null == propertyNeighborhood ? _self.propertyNeighborhood : propertyNeighborhood // ignore: cast_nullable_to_non_nullable
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
/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get userRef {
  
  return $UserModelCopyWith<$Res>(_self.userRef, (value) {
    return _then(_self.copyWith(userRef: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String propertyName,  String propertyDescription,  String mainImage,  String propertyAddress,  bool isDraft,  UserModel userRef,  String propertyNeighborhood,  double ratingSummary,  int price,  double taxRate,  int cleaningFee,  String notes,  double minNightStay,  String lastUpdated,  int minNights,  bool isLive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
return $default(_that.propertyName,_that.propertyDescription,_that.mainImage,_that.propertyAddress,_that.isDraft,_that.userRef,_that.propertyNeighborhood,_that.ratingSummary,_that.price,_that.taxRate,_that.cleaningFee,_that.notes,_that.minNightStay,_that.lastUpdated,_that.minNights,_that.isLive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String propertyName,  String propertyDescription,  String mainImage,  String propertyAddress,  bool isDraft,  UserModel userRef,  String propertyNeighborhood,  double ratingSummary,  int price,  double taxRate,  int cleaningFee,  String notes,  double minNightStay,  String lastUpdated,  int minNights,  bool isLive)  $default,) {final _that = this;
switch (_that) {
case _PropertyModel():
return $default(_that.propertyName,_that.propertyDescription,_that.mainImage,_that.propertyAddress,_that.isDraft,_that.userRef,_that.propertyNeighborhood,_that.ratingSummary,_that.price,_that.taxRate,_that.cleaningFee,_that.notes,_that.minNightStay,_that.lastUpdated,_that.minNights,_that.isLive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String propertyName,  String propertyDescription,  String mainImage,  String propertyAddress,  bool isDraft,  UserModel userRef,  String propertyNeighborhood,  double ratingSummary,  int price,  double taxRate,  int cleaningFee,  String notes,  double minNightStay,  String lastUpdated,  int minNights,  bool isLive)?  $default,) {final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
return $default(_that.propertyName,_that.propertyDescription,_that.mainImage,_that.propertyAddress,_that.isDraft,_that.userRef,_that.propertyNeighborhood,_that.ratingSummary,_that.price,_that.taxRate,_that.cleaningFee,_that.notes,_that.minNightStay,_that.lastUpdated,_that.minNights,_that.isLive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyModel implements PropertyModel {
  const _PropertyModel({required this.propertyName, required this.propertyDescription, required this.mainImage, required this.propertyAddress, required this.isDraft, required this.userRef, required this.propertyNeighborhood, required this.ratingSummary, required this.price, required this.taxRate, required this.cleaningFee, required this.notes, required this.minNightStay, required this.lastUpdated, required this.minNights, required this.isLive});
  factory _PropertyModel.fromJson(Map<String, dynamic> json) => _$PropertyModelFromJson(json);

@override final  String propertyName;
@override final  String propertyDescription;
@override final  String mainImage;
@override final  String propertyAddress;
@override final  bool isDraft;
@override final  UserModel userRef;
@override final  String propertyNeighborhood;
@override final  double ratingSummary;
@override final  int price;
@override final  double taxRate;
@override final  int cleaningFee;
@override final  String notes;
@override final  double minNightStay;
@override final  String lastUpdated;
@override final  int minNights;
@override final  bool isLive;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyModel&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyDescription, propertyDescription) || other.propertyDescription == propertyDescription)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.propertyAddress, propertyAddress) || other.propertyAddress == propertyAddress)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.userRef, userRef) || other.userRef == userRef)&&(identical(other.propertyNeighborhood, propertyNeighborhood) || other.propertyNeighborhood == propertyNeighborhood)&&(identical(other.ratingSummary, ratingSummary) || other.ratingSummary == ratingSummary)&&(identical(other.price, price) || other.price == price)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.cleaningFee, cleaningFee) || other.cleaningFee == cleaningFee)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.minNightStay, minNightStay) || other.minNightStay == minNightStay)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyName,propertyDescription,mainImage,propertyAddress,isDraft,userRef,propertyNeighborhood,ratingSummary,price,taxRate,cleaningFee,notes,minNightStay,lastUpdated,minNights,isLive);

@override
String toString() {
  return 'PropertyModel(propertyName: $propertyName, propertyDescription: $propertyDescription, mainImage: $mainImage, propertyAddress: $propertyAddress, isDraft: $isDraft, userRef: $userRef, propertyNeighborhood: $propertyNeighborhood, ratingSummary: $ratingSummary, price: $price, taxRate: $taxRate, cleaningFee: $cleaningFee, notes: $notes, minNightStay: $minNightStay, lastUpdated: $lastUpdated, minNights: $minNights, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class _$PropertyModelCopyWith<$Res> implements $PropertyModelCopyWith<$Res> {
  factory _$PropertyModelCopyWith(_PropertyModel value, $Res Function(_PropertyModel) _then) = __$PropertyModelCopyWithImpl;
@override @useResult
$Res call({
 String propertyName, String propertyDescription, String mainImage, String propertyAddress, bool isDraft, UserModel userRef, String propertyNeighborhood, double ratingSummary, int price, double taxRate, int cleaningFee, String notes, double minNightStay, String lastUpdated, int minNights, bool isLive
});


@override $UserModelCopyWith<$Res> get userRef;

}
/// @nodoc
class __$PropertyModelCopyWithImpl<$Res>
    implements _$PropertyModelCopyWith<$Res> {
  __$PropertyModelCopyWithImpl(this._self, this._then);

  final _PropertyModel _self;
  final $Res Function(_PropertyModel) _then;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? propertyName = null,Object? propertyDescription = null,Object? mainImage = null,Object? propertyAddress = null,Object? isDraft = null,Object? userRef = null,Object? propertyNeighborhood = null,Object? ratingSummary = null,Object? price = null,Object? taxRate = null,Object? cleaningFee = null,Object? notes = null,Object? minNightStay = null,Object? lastUpdated = null,Object? minNights = null,Object? isLive = null,}) {
  return _then(_PropertyModel(
propertyName: null == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String,propertyDescription: null == propertyDescription ? _self.propertyDescription : propertyDescription // ignore: cast_nullable_to_non_nullable
as String,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,propertyAddress: null == propertyAddress ? _self.propertyAddress : propertyAddress // ignore: cast_nullable_to_non_nullable
as String,isDraft: null == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool,userRef: null == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as UserModel,propertyNeighborhood: null == propertyNeighborhood ? _self.propertyNeighborhood : propertyNeighborhood // ignore: cast_nullable_to_non_nullable
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

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get userRef {
  
  return $UserModelCopyWith<$Res>(_self.userRef, (value) {
    return _then(_self.copyWith(userRef: value));
  });
}
}

// dart format on
