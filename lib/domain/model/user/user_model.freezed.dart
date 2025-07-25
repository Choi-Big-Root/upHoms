// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String? get userCity; String? get email; String? get password; String? get displayName; String? get photoUrl; int? get uid; String? get createdTime; String? get phoneNumber; String? get bio; bool? get isHost; List<int>? get numberPropertyList; List<int>? get numberActiveBookingsList;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.userCity, userCity) || other.userCity == userCity)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.createdTime, createdTime) || other.createdTime == createdTime)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.isHost, isHost) || other.isHost == isHost)&&const DeepCollectionEquality().equals(other.numberPropertyList, numberPropertyList)&&const DeepCollectionEquality().equals(other.numberActiveBookingsList, numberActiveBookingsList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userCity,email,password,displayName,photoUrl,uid,createdTime,phoneNumber,bio,isHost,const DeepCollectionEquality().hash(numberPropertyList),const DeepCollectionEquality().hash(numberActiveBookingsList));

@override
String toString() {
  return 'UserModel(userCity: $userCity, email: $email, password: $password, displayName: $displayName, photoUrl: $photoUrl, uid: $uid, createdTime: $createdTime, phoneNumber: $phoneNumber, bio: $bio, isHost: $isHost, numberPropertyList: $numberPropertyList, numberActiveBookingsList: $numberActiveBookingsList)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String? userCity, String? email, String? password, String? displayName, String? photoUrl, int? uid, String? createdTime, String? phoneNumber, String? bio, bool? isHost, List<int>? numberPropertyList, List<int>? numberActiveBookingsList
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userCity = freezed,Object? email = freezed,Object? password = freezed,Object? displayName = freezed,Object? photoUrl = freezed,Object? uid = freezed,Object? createdTime = freezed,Object? phoneNumber = freezed,Object? bio = freezed,Object? isHost = freezed,Object? numberPropertyList = freezed,Object? numberActiveBookingsList = freezed,}) {
  return _then(_self.copyWith(
userCity: freezed == userCity ? _self.userCity : userCity // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,createdTime: freezed == createdTime ? _self.createdTime : createdTime // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,isHost: freezed == isHost ? _self.isHost : isHost // ignore: cast_nullable_to_non_nullable
as bool?,numberPropertyList: freezed == numberPropertyList ? _self.numberPropertyList : numberPropertyList // ignore: cast_nullable_to_non_nullable
as List<int>?,numberActiveBookingsList: freezed == numberActiveBookingsList ? _self.numberActiveBookingsList : numberActiveBookingsList // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userCity,  String? email,  String? password,  String? displayName,  String? photoUrl,  int? uid,  String? createdTime,  String? phoneNumber,  String? bio,  bool? isHost,  List<int>? numberPropertyList,  List<int>? numberActiveBookingsList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userCity,  String? email,  String? password,  String? displayName,  String? photoUrl,  int? uid,  String? createdTime,  String? phoneNumber,  String? bio,  bool? isHost,  List<int>? numberPropertyList,  List<int>? numberActiveBookingsList)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userCity,  String? email,  String? password,  String? displayName,  String? photoUrl,  int? uid,  String? createdTime,  String? phoneNumber,  String? bio,  bool? isHost,  List<int>? numberPropertyList,  List<int>? numberActiveBookingsList)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.userCity,_that.email,_that.password,_that.displayName,_that.photoUrl,_that.uid,_that.createdTime,_that.phoneNumber,_that.bio,_that.isHost,_that.numberPropertyList,_that.numberActiveBookingsList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({this.userCity, this.email, this.password, this.displayName, this.photoUrl, this.uid, this.createdTime, this.phoneNumber, this.bio, this.isHost, final  List<int>? numberPropertyList, final  List<int>? numberActiveBookingsList}): _numberPropertyList = numberPropertyList,_numberActiveBookingsList = numberActiveBookingsList;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String? userCity;
@override final  String? email;
@override final  String? password;
@override final  String? displayName;
@override final  String? photoUrl;
@override final  int? uid;
@override final  String? createdTime;
@override final  String? phoneNumber;
@override final  String? bio;
@override final  bool? isHost;
 final  List<int>? _numberPropertyList;
@override List<int>? get numberPropertyList {
  final value = _numberPropertyList;
  if (value == null) return null;
  if (_numberPropertyList is EqualUnmodifiableListView) return _numberPropertyList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _numberActiveBookingsList;
@override List<int>? get numberActiveBookingsList {
  final value = _numberActiveBookingsList;
  if (value == null) return null;
  if (_numberActiveBookingsList is EqualUnmodifiableListView) return _numberActiveBookingsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.userCity, userCity) || other.userCity == userCity)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.createdTime, createdTime) || other.createdTime == createdTime)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.isHost, isHost) || other.isHost == isHost)&&const DeepCollectionEquality().equals(other._numberPropertyList, _numberPropertyList)&&const DeepCollectionEquality().equals(other._numberActiveBookingsList, _numberActiveBookingsList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userCity,email,password,displayName,photoUrl,uid,createdTime,phoneNumber,bio,isHost,const DeepCollectionEquality().hash(_numberPropertyList),const DeepCollectionEquality().hash(_numberActiveBookingsList));

@override
String toString() {
  return 'UserModel(userCity: $userCity, email: $email, password: $password, displayName: $displayName, photoUrl: $photoUrl, uid: $uid, createdTime: $createdTime, phoneNumber: $phoneNumber, bio: $bio, isHost: $isHost, numberPropertyList: $numberPropertyList, numberActiveBookingsList: $numberActiveBookingsList)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String? userCity, String? email, String? password, String? displayName, String? photoUrl, int? uid, String? createdTime, String? phoneNumber, String? bio, bool? isHost, List<int>? numberPropertyList, List<int>? numberActiveBookingsList
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userCity = freezed,Object? email = freezed,Object? password = freezed,Object? displayName = freezed,Object? photoUrl = freezed,Object? uid = freezed,Object? createdTime = freezed,Object? phoneNumber = freezed,Object? bio = freezed,Object? isHost = freezed,Object? numberPropertyList = freezed,Object? numberActiveBookingsList = freezed,}) {
  return _then(_UserModel(
userCity: freezed == userCity ? _self.userCity : userCity // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,createdTime: freezed == createdTime ? _self.createdTime : createdTime // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,isHost: freezed == isHost ? _self.isHost : isHost // ignore: cast_nullable_to_non_nullable
as bool?,numberPropertyList: freezed == numberPropertyList ? _self._numberPropertyList : numberPropertyList // ignore: cast_nullable_to_non_nullable
as List<int>?,numberActiveBookingsList: freezed == numberActiveBookingsList ? _self._numberActiveBookingsList : numberActiveBookingsList // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

// dart format on
