// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewDto {

 int get reviewId; int get propertyId; UserDto get user; double get rating; String get ratingDescription; String get ratingCreated;
/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDtoCopyWith<ReviewDto> get copyWith => _$ReviewDtoCopyWithImpl<ReviewDto>(this as ReviewDto, _$identity);

  /// Serializes this ReviewDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDto&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.user, user) || other.user == user)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingDescription, ratingDescription) || other.ratingDescription == ratingDescription)&&(identical(other.ratingCreated, ratingCreated) || other.ratingCreated == ratingCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reviewId,propertyId,user,rating,ratingDescription,ratingCreated);

@override
String toString() {
  return 'ReviewDto(reviewId: $reviewId, propertyId: $propertyId, user: $user, rating: $rating, ratingDescription: $ratingDescription, ratingCreated: $ratingCreated)';
}


}

/// @nodoc
abstract mixin class $ReviewDtoCopyWith<$Res>  {
  factory $ReviewDtoCopyWith(ReviewDto value, $Res Function(ReviewDto) _then) = _$ReviewDtoCopyWithImpl;
@useResult
$Res call({
 int reviewId, int propertyId, UserDto user, double rating, String ratingDescription, String ratingCreated
});


$UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class _$ReviewDtoCopyWithImpl<$Res>
    implements $ReviewDtoCopyWith<$Res> {
  _$ReviewDtoCopyWithImpl(this._self, this._then);

  final ReviewDto _self;
  final $Res Function(ReviewDto) _then;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reviewId = null,Object? propertyId = null,Object? user = null,Object? rating = null,Object? ratingDescription = null,Object? ratingCreated = null,}) {
  return _then(_self.copyWith(
reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as int,propertyId: null == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingDescription: null == ratingDescription ? _self.ratingDescription : ratingDescription // ignore: cast_nullable_to_non_nullable
as String,ratingCreated: null == ratingCreated ? _self.ratingCreated : ratingCreated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewDto].
extension ReviewDtoPatterns on ReviewDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewDto value)  $default,){
final _that = this;
switch (_that) {
case _ReviewDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int reviewId,  int propertyId,  UserDto user,  double rating,  String ratingDescription,  String ratingCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
return $default(_that.reviewId,_that.propertyId,_that.user,_that.rating,_that.ratingDescription,_that.ratingCreated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int reviewId,  int propertyId,  UserDto user,  double rating,  String ratingDescription,  String ratingCreated)  $default,) {final _that = this;
switch (_that) {
case _ReviewDto():
return $default(_that.reviewId,_that.propertyId,_that.user,_that.rating,_that.ratingDescription,_that.ratingCreated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int reviewId,  int propertyId,  UserDto user,  double rating,  String ratingDescription,  String ratingCreated)?  $default,) {final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
return $default(_that.reviewId,_that.propertyId,_that.user,_that.rating,_that.ratingDescription,_that.ratingCreated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewDto implements ReviewDto {
  const _ReviewDto({this.reviewId = -1, this.propertyId = -1, this.user = const UserDto(), this.rating = 0.0, this.ratingDescription = '', this.ratingCreated = ''});
  factory _ReviewDto.fromJson(Map<String, dynamic> json) => _$ReviewDtoFromJson(json);

@override@JsonKey() final  int reviewId;
@override@JsonKey() final  int propertyId;
@override@JsonKey() final  UserDto user;
@override@JsonKey() final  double rating;
@override@JsonKey() final  String ratingDescription;
@override@JsonKey() final  String ratingCreated;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewDtoCopyWith<_ReviewDto> get copyWith => __$ReviewDtoCopyWithImpl<_ReviewDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDto&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.user, user) || other.user == user)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingDescription, ratingDescription) || other.ratingDescription == ratingDescription)&&(identical(other.ratingCreated, ratingCreated) || other.ratingCreated == ratingCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reviewId,propertyId,user,rating,ratingDescription,ratingCreated);

@override
String toString() {
  return 'ReviewDto(reviewId: $reviewId, propertyId: $propertyId, user: $user, rating: $rating, ratingDescription: $ratingDescription, ratingCreated: $ratingCreated)';
}


}

/// @nodoc
abstract mixin class _$ReviewDtoCopyWith<$Res> implements $ReviewDtoCopyWith<$Res> {
  factory _$ReviewDtoCopyWith(_ReviewDto value, $Res Function(_ReviewDto) _then) = __$ReviewDtoCopyWithImpl;
@override @useResult
$Res call({
 int reviewId, int propertyId, UserDto user, double rating, String ratingDescription, String ratingCreated
});


@override $UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class __$ReviewDtoCopyWithImpl<$Res>
    implements _$ReviewDtoCopyWith<$Res> {
  __$ReviewDtoCopyWithImpl(this._self, this._then);

  final _ReviewDto _self;
  final $Res Function(_ReviewDto) _then;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reviewId = null,Object? propertyId = null,Object? user = null,Object? rating = null,Object? ratingDescription = null,Object? ratingCreated = null,}) {
  return _then(_ReviewDto(
reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as int,propertyId: null == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingDescription: null == ratingDescription ? _self.ratingDescription : ratingDescription // ignore: cast_nullable_to_non_nullable
as String,ratingCreated: null == ratingCreated ? _self.ratingCreated : ratingCreated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ReviewDto
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
