// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewModel {

 int? get reviewId; int? get propertyId; int? get userUid; double? get rating; String? get ratingDescription; String? get ratingCreated;
/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewModelCopyWith<ReviewModel> get copyWith => _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewModel&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.userUid, userUid) || other.userUid == userUid)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingDescription, ratingDescription) || other.ratingDescription == ratingDescription)&&(identical(other.ratingCreated, ratingCreated) || other.ratingCreated == ratingCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reviewId,propertyId,userUid,rating,ratingDescription,ratingCreated);

@override
String toString() {
  return 'ReviewModel(reviewId: $reviewId, propertyId: $propertyId, userUid: $userUid, rating: $rating, ratingDescription: $ratingDescription, ratingCreated: $ratingCreated)';
}


}

/// @nodoc
abstract mixin class $ReviewModelCopyWith<$Res>  {
  factory $ReviewModelCopyWith(ReviewModel value, $Res Function(ReviewModel) _then) = _$ReviewModelCopyWithImpl;
@useResult
$Res call({
 int? reviewId, int? propertyId, int? userUid, double? rating, String? ratingDescription, String? ratingCreated
});




}
/// @nodoc
class _$ReviewModelCopyWithImpl<$Res>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);

  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reviewId = freezed,Object? propertyId = freezed,Object? userUid = freezed,Object? rating = freezed,Object? ratingDescription = freezed,Object? ratingCreated = freezed,}) {
  return _then(_self.copyWith(
reviewId: freezed == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as int?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,userUid: freezed == userUid ? _self.userUid : userUid // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,ratingDescription: freezed == ratingDescription ? _self.ratingDescription : ratingDescription // ignore: cast_nullable_to_non_nullable
as String?,ratingCreated: freezed == ratingCreated ? _self.ratingCreated : ratingCreated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewModel].
extension ReviewModelPatterns on ReviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? reviewId,  int? propertyId,  int? userUid,  double? rating,  String? ratingDescription,  String? ratingCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.reviewId,_that.propertyId,_that.userUid,_that.rating,_that.ratingDescription,_that.ratingCreated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? reviewId,  int? propertyId,  int? userUid,  double? rating,  String? ratingDescription,  String? ratingCreated)  $default,) {final _that = this;
switch (_that) {
case _ReviewModel():
return $default(_that.reviewId,_that.propertyId,_that.userUid,_that.rating,_that.ratingDescription,_that.ratingCreated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? reviewId,  int? propertyId,  int? userUid,  double? rating,  String? ratingDescription,  String? ratingCreated)?  $default,) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.reviewId,_that.propertyId,_that.userUid,_that.rating,_that.ratingDescription,_that.ratingCreated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewModel implements ReviewModel {
  const _ReviewModel({this.reviewId, this.propertyId, this.userUid, this.rating, this.ratingDescription, this.ratingCreated});
  factory _ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);

@override final  int? reviewId;
@override final  int? propertyId;
@override final  int? userUid;
@override final  double? rating;
@override final  String? ratingDescription;
@override final  String? ratingCreated;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewModelCopyWith<_ReviewModel> get copyWith => __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewModel&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.userUid, userUid) || other.userUid == userUid)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingDescription, ratingDescription) || other.ratingDescription == ratingDescription)&&(identical(other.ratingCreated, ratingCreated) || other.ratingCreated == ratingCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reviewId,propertyId,userUid,rating,ratingDescription,ratingCreated);

@override
String toString() {
  return 'ReviewModel(reviewId: $reviewId, propertyId: $propertyId, userUid: $userUid, rating: $rating, ratingDescription: $ratingDescription, ratingCreated: $ratingCreated)';
}


}

/// @nodoc
abstract mixin class _$ReviewModelCopyWith<$Res> implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(_ReviewModel value, $Res Function(_ReviewModel) _then) = __$ReviewModelCopyWithImpl;
@override @useResult
$Res call({
 int? reviewId, int? propertyId, int? userUid, double? rating, String? ratingDescription, String? ratingCreated
});




}
/// @nodoc
class __$ReviewModelCopyWithImpl<$Res>
    implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);

  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reviewId = freezed,Object? propertyId = freezed,Object? userUid = freezed,Object? rating = freezed,Object? ratingDescription = freezed,Object? ratingCreated = freezed,}) {
  return _then(_ReviewModel(
reviewId: freezed == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as int?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,userUid: freezed == userUid ? _self.userUid : userUid // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,ratingDescription: freezed == ratingDescription ? _self.ratingDescription : ratingDescription // ignore: cast_nullable_to_non_nullable
as String?,ratingCreated: freezed == ratingCreated ? _self.ratingCreated : ratingCreated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
