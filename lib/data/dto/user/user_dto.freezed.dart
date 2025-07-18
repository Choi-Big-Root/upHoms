// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDto {

 String get userCity; String get email; String get password; String get displayName; String get photoUrl; int get uid; String get createdTime; String get phoneNumber; String get bio; bool get isHost; List<int> get numberPropertyList; List<int> get numberActiveBookingsList;
/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDtoCopyWith<UserDto> get copyWith => _$UserDtoCopyWithImpl<UserDto>(this as UserDto, _$identity);

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDto&&(identical(other.userCity, userCity) || other.userCity == userCity)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.createdTime, createdTime) || other.createdTime == createdTime)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.isHost, isHost) || other.isHost == isHost)&&const DeepCollectionEquality().equals(other.numberPropertyList, numberPropertyList)&&const DeepCollectionEquality().equals(other.numberActiveBookingsList, numberActiveBookingsList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userCity,email,password,displayName,photoUrl,uid,createdTime,phoneNumber,bio,isHost,const DeepCollectionEquality().hash(numberPropertyList),const DeepCollectionEquality().hash(numberActiveBookingsList));

@override
String toString() {
  return 'UserDto(userCity: $userCity, email: $email, password: $password, displayName: $displayName, photoUrl: $photoUrl, uid: $uid, createdTime: $createdTime, phoneNumber: $phoneNumber, bio: $bio, isHost: $isHost, numberPropertyList: $numberPropertyList, numberActiveBookingsList: $numberActiveBookingsList)';
}


}

/// @nodoc
abstract mixin class $UserDtoCopyWith<$Res>  {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) _then) = _$UserDtoCopyWithImpl;
@useResult
$Res call({
 String userCity, String email, String password, String displayName, String photoUrl, int uid, String createdTime, String phoneNumber, String bio, bool isHost, List<int> numberPropertyList, List<int> numberActiveBookingsList
});




}
/// @nodoc
class _$UserDtoCopyWithImpl<$Res>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._self, this._then);

  final UserDto _self;
  final $Res Function(UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userCity = null,Object? email = null,Object? password = null,Object? displayName = null,Object? photoUrl = null,Object? uid = null,Object? createdTime = null,Object? phoneNumber = null,Object? bio = null,Object? isHost = null,Object? numberPropertyList = null,Object? numberActiveBookingsList = null,}) {
  return _then(_self.copyWith(
userCity: null == userCity ? _self.userCity : userCity // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,createdTime: null == createdTime ? _self.createdTime : createdTime // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,isHost: null == isHost ? _self.isHost : isHost // ignore: cast_nullable_to_non_nullable
as bool,numberPropertyList: null == numberPropertyList ? _self.numberPropertyList : numberPropertyList // ignore: cast_nullable_to_non_nullable
as List<int>,numberActiveBookingsList: null == numberActiveBookingsList ? _self.numberActiveBookingsList : numberActiveBookingsList // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDto].
extension UserDtoPatterns on UserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDto value)  $default,){
final _that = this;
switch (_that) {
case _UserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userCity,  String email,  String password,  String displayName,  String photoUrl,  int uid,  String createdTime,  String phoneNumber,  String bio,  bool isHost,  List<int> numberPropertyList,  List<int> numberActiveBookingsList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.userCity,_that.email,_that.password,_that.displayName,_that.photoUrl,_that.uid,_that.createdTime,_that.phoneNumber,_that.bio,_that.isHost,_that.numberPropertyList,_that.numberActiveBookingsList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userCity,  String email,  String password,  String displayName,  String photoUrl,  int uid,  String createdTime,  String phoneNumber,  String bio,  bool isHost,  List<int> numberPropertyList,  List<int> numberActiveBookingsList)  $default,) {final _that = this;
switch (_that) {
case _UserDto():
return $default(_that.userCity,_that.email,_that.password,_that.displayName,_that.photoUrl,_that.uid,_that.createdTime,_that.phoneNumber,_that.bio,_that.isHost,_that.numberPropertyList,_that.numberActiveBookingsList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userCity,  String email,  String password,  String displayName,  String photoUrl,  int uid,  String createdTime,  String phoneNumber,  String bio,  bool isHost,  List<int> numberPropertyList,  List<int> numberActiveBookingsList)?  $default,) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.userCity,_that.email,_that.password,_that.displayName,_that.photoUrl,_that.uid,_that.createdTime,_that.phoneNumber,_that.bio,_that.isHost,_that.numberPropertyList,_that.numberActiveBookingsList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDto implements UserDto {
  const _UserDto({this.userCity = '', this.email = '', this.password = '', this.displayName = '', this.photoUrl = '', this.uid = -1, this.createdTime = '', this.phoneNumber = '', this.bio = '', this.isHost = false, final  List<int> numberPropertyList = const [], final  List<int> numberActiveBookingsList = const []}): _numberPropertyList = numberPropertyList,_numberActiveBookingsList = numberActiveBookingsList;
  factory _UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

@override@JsonKey() final  String userCity;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  String displayName;
@override@JsonKey() final  String photoUrl;
@override@JsonKey() final  int uid;
@override@JsonKey() final  String createdTime;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String bio;
@override@JsonKey() final  bool isHost;
 final  List<int> _numberPropertyList;
@override@JsonKey() List<int> get numberPropertyList {
  if (_numberPropertyList is EqualUnmodifiableListView) return _numberPropertyList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_numberPropertyList);
}

 final  List<int> _numberActiveBookingsList;
@override@JsonKey() List<int> get numberActiveBookingsList {
  if (_numberActiveBookingsList is EqualUnmodifiableListView) return _numberActiveBookingsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_numberActiveBookingsList);
}


/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDtoCopyWith<_UserDto> get copyWith => __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDto&&(identical(other.userCity, userCity) || other.userCity == userCity)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.createdTime, createdTime) || other.createdTime == createdTime)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.isHost, isHost) || other.isHost == isHost)&&const DeepCollectionEquality().equals(other._numberPropertyList, _numberPropertyList)&&const DeepCollectionEquality().equals(other._numberActiveBookingsList, _numberActiveBookingsList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userCity,email,password,displayName,photoUrl,uid,createdTime,phoneNumber,bio,isHost,const DeepCollectionEquality().hash(_numberPropertyList),const DeepCollectionEquality().hash(_numberActiveBookingsList));

@override
String toString() {
  return 'UserDto(userCity: $userCity, email: $email, password: $password, displayName: $displayName, photoUrl: $photoUrl, uid: $uid, createdTime: $createdTime, phoneNumber: $phoneNumber, bio: $bio, isHost: $isHost, numberPropertyList: $numberPropertyList, numberActiveBookingsList: $numberActiveBookingsList)';
}


}

/// @nodoc
abstract mixin class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) _then) = __$UserDtoCopyWithImpl;
@override @useResult
$Res call({
 String userCity, String email, String password, String displayName, String photoUrl, int uid, String createdTime, String phoneNumber, String bio, bool isHost, List<int> numberPropertyList, List<int> numberActiveBookingsList
});




}
/// @nodoc
class __$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(this._self, this._then);

  final _UserDto _self;
  final $Res Function(_UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userCity = null,Object? email = null,Object? password = null,Object? displayName = null,Object? photoUrl = null,Object? uid = null,Object? createdTime = null,Object? phoneNumber = null,Object? bio = null,Object? isHost = null,Object? numberPropertyList = null,Object? numberActiveBookingsList = null,}) {
  return _then(_UserDto(
userCity: null == userCity ? _self.userCity : userCity // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,createdTime: null == createdTime ? _self.createdTime : createdTime // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,isHost: null == isHost ? _self.isHost : isHost // ignore: cast_nullable_to_non_nullable
as bool,numberPropertyList: null == numberPropertyList ? _self._numberPropertyList : numberPropertyList // ignore: cast_nullable_to_non_nullable
as List<int>,numberActiveBookingsList: null == numberActiveBookingsList ? _self._numberActiveBookingsList : numberActiveBookingsList // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
