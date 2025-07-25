// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_bloc.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripState()';
}


}

/// @nodoc
class $TripStateCopyWith<$Res>  {
$TripStateCopyWith(TripState _, $Res Function(TripState) __);
}


/// Adds pattern-matching-related methods to [TripState].
extension TripStatePatterns on TripState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Success value)?  success,TResult Function( Error value)?  error,TResult Function( AddTripSuccess value)?  addTripSuccess,TResult Function( GetTripSuccess value)?  getTripSuccess,TResult Function( GetTripsWithUserSuccess value)?  getTripsWithUserSuccess,TResult Function( CancelTripSuccess value)?  cancelTripSuccess,TResult Function( GetTripsWithHostSuccess value)?  getTripsWithHostSuccess,TResult Function( CompleteTripSuccess value)?  completeTripSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case AddTripSuccess() when addTripSuccess != null:
return addTripSuccess(_that);case GetTripSuccess() when getTripSuccess != null:
return getTripSuccess(_that);case GetTripsWithUserSuccess() when getTripsWithUserSuccess != null:
return getTripsWithUserSuccess(_that);case CancelTripSuccess() when cancelTripSuccess != null:
return cancelTripSuccess(_that);case GetTripsWithHostSuccess() when getTripsWithHostSuccess != null:
return getTripsWithHostSuccess(_that);case CompleteTripSuccess() when completeTripSuccess != null:
return completeTripSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Success value)  success,required TResult Function( Error value)  error,required TResult Function( AddTripSuccess value)  addTripSuccess,required TResult Function( GetTripSuccess value)  getTripSuccess,required TResult Function( GetTripsWithUserSuccess value)  getTripsWithUserSuccess,required TResult Function( CancelTripSuccess value)  cancelTripSuccess,required TResult Function( GetTripsWithHostSuccess value)  getTripsWithHostSuccess,required TResult Function( CompleteTripSuccess value)  completeTripSuccess,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Error():
return error(_that);case AddTripSuccess():
return addTripSuccess(_that);case GetTripSuccess():
return getTripSuccess(_that);case GetTripsWithUserSuccess():
return getTripsWithUserSuccess(_that);case CancelTripSuccess():
return cancelTripSuccess(_that);case GetTripsWithHostSuccess():
return getTripsWithHostSuccess(_that);case CompleteTripSuccess():
return completeTripSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Success value)?  success,TResult? Function( Error value)?  error,TResult? Function( AddTripSuccess value)?  addTripSuccess,TResult? Function( GetTripSuccess value)?  getTripSuccess,TResult? Function( GetTripsWithUserSuccess value)?  getTripsWithUserSuccess,TResult? Function( CancelTripSuccess value)?  cancelTripSuccess,TResult? Function( GetTripsWithHostSuccess value)?  getTripsWithHostSuccess,TResult? Function( CompleteTripSuccess value)?  completeTripSuccess,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case AddTripSuccess() when addTripSuccess != null:
return addTripSuccess(_that);case GetTripSuccess() when getTripSuccess != null:
return getTripSuccess(_that);case GetTripsWithUserSuccess() when getTripsWithUserSuccess != null:
return getTripsWithUserSuccess(_that);case CancelTripSuccess() when cancelTripSuccess != null:
return cancelTripSuccess(_that);case GetTripsWithHostSuccess() when getTripsWithHostSuccess != null:
return getTripsWithHostSuccess(_that);case CompleteTripSuccess() when completeTripSuccess != null:
return completeTripSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,TResult Function( TripModel trip)?  addTripSuccess,TResult Function( TripModel trip)?  getTripSuccess,TResult Function( List<TripModel> trips)?  getTripsWithUserSuccess,TResult Function( TripModel trip)?  cancelTripSuccess,TResult Function( List<TripModel> trips)?  getTripsWithHostSuccess,TResult Function( TripModel trip)?  completeTripSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success();case Error() when error != null:
return error(_that.message);case AddTripSuccess() when addTripSuccess != null:
return addTripSuccess(_that.trip);case GetTripSuccess() when getTripSuccess != null:
return getTripSuccess(_that.trip);case GetTripsWithUserSuccess() when getTripsWithUserSuccess != null:
return getTripsWithUserSuccess(_that.trips);case CancelTripSuccess() when cancelTripSuccess != null:
return cancelTripSuccess(_that.trip);case GetTripsWithHostSuccess() when getTripsWithHostSuccess != null:
return getTripsWithHostSuccess(_that.trips);case CompleteTripSuccess() when completeTripSuccess != null:
return completeTripSuccess(_that.trip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,required TResult Function( TripModel trip)  addTripSuccess,required TResult Function( TripModel trip)  getTripSuccess,required TResult Function( List<TripModel> trips)  getTripsWithUserSuccess,required TResult Function( TripModel trip)  cancelTripSuccess,required TResult Function( List<TripModel> trips)  getTripsWithHostSuccess,required TResult Function( TripModel trip)  completeTripSuccess,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Success():
return success();case Error():
return error(_that.message);case AddTripSuccess():
return addTripSuccess(_that.trip);case GetTripSuccess():
return getTripSuccess(_that.trip);case GetTripsWithUserSuccess():
return getTripsWithUserSuccess(_that.trips);case CancelTripSuccess():
return cancelTripSuccess(_that.trip);case GetTripsWithHostSuccess():
return getTripsWithHostSuccess(_that.trips);case CompleteTripSuccess():
return completeTripSuccess(_that.trip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,TResult? Function( TripModel trip)?  addTripSuccess,TResult? Function( TripModel trip)?  getTripSuccess,TResult? Function( List<TripModel> trips)?  getTripsWithUserSuccess,TResult? Function( TripModel trip)?  cancelTripSuccess,TResult? Function( List<TripModel> trips)?  getTripsWithHostSuccess,TResult? Function( TripModel trip)?  completeTripSuccess,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success();case Error() when error != null:
return error(_that.message);case AddTripSuccess() when addTripSuccess != null:
return addTripSuccess(_that.trip);case GetTripSuccess() when getTripSuccess != null:
return getTripSuccess(_that.trip);case GetTripsWithUserSuccess() when getTripsWithUserSuccess != null:
return getTripsWithUserSuccess(_that.trips);case CancelTripSuccess() when cancelTripSuccess != null:
return cancelTripSuccess(_that.trip);case GetTripsWithHostSuccess() when getTripsWithHostSuccess != null:
return getTripsWithHostSuccess(_that.trips);case CompleteTripSuccess() when completeTripSuccess != null:
return completeTripSuccess(_that.trip);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements TripState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripState.initial()';
}


}




/// @nodoc


class Loading implements TripState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripState.loading()';
}


}




/// @nodoc


class Success implements TripState {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripState.success()';
}


}




/// @nodoc


class Error implements TripState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TripState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $TripStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddTripSuccess implements TripState {
  const AddTripSuccess(this.trip);
  

 final  TripModel trip;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTripSuccessCopyWith<AddTripSuccess> get copyWith => _$AddTripSuccessCopyWithImpl<AddTripSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTripSuccess&&(identical(other.trip, trip) || other.trip == trip));
}


@override
int get hashCode => Object.hash(runtimeType,trip);

@override
String toString() {
  return 'TripState.addTripSuccess(trip: $trip)';
}


}

/// @nodoc
abstract mixin class $AddTripSuccessCopyWith<$Res> implements $TripStateCopyWith<$Res> {
  factory $AddTripSuccessCopyWith(AddTripSuccess value, $Res Function(AddTripSuccess) _then) = _$AddTripSuccessCopyWithImpl;
@useResult
$Res call({
 TripModel trip
});


$TripModelCopyWith<$Res> get trip;

}
/// @nodoc
class _$AddTripSuccessCopyWithImpl<$Res>
    implements $AddTripSuccessCopyWith<$Res> {
  _$AddTripSuccessCopyWithImpl(this._self, this._then);

  final AddTripSuccess _self;
  final $Res Function(AddTripSuccess) _then;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trip = null,}) {
  return _then(AddTripSuccess(
null == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripModel,
  ));
}

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripModelCopyWith<$Res> get trip {
  
  return $TripModelCopyWith<$Res>(_self.trip, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}

/// @nodoc


class GetTripSuccess implements TripState {
  const GetTripSuccess(this.trip);
  

 final  TripModel trip;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTripSuccessCopyWith<GetTripSuccess> get copyWith => _$GetTripSuccessCopyWithImpl<GetTripSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTripSuccess&&(identical(other.trip, trip) || other.trip == trip));
}


@override
int get hashCode => Object.hash(runtimeType,trip);

@override
String toString() {
  return 'TripState.getTripSuccess(trip: $trip)';
}


}

/// @nodoc
abstract mixin class $GetTripSuccessCopyWith<$Res> implements $TripStateCopyWith<$Res> {
  factory $GetTripSuccessCopyWith(GetTripSuccess value, $Res Function(GetTripSuccess) _then) = _$GetTripSuccessCopyWithImpl;
@useResult
$Res call({
 TripModel trip
});


$TripModelCopyWith<$Res> get trip;

}
/// @nodoc
class _$GetTripSuccessCopyWithImpl<$Res>
    implements $GetTripSuccessCopyWith<$Res> {
  _$GetTripSuccessCopyWithImpl(this._self, this._then);

  final GetTripSuccess _self;
  final $Res Function(GetTripSuccess) _then;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trip = null,}) {
  return _then(GetTripSuccess(
null == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripModel,
  ));
}

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripModelCopyWith<$Res> get trip {
  
  return $TripModelCopyWith<$Res>(_self.trip, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}

/// @nodoc


class GetTripsWithUserSuccess implements TripState {
  const GetTripsWithUserSuccess(final  List<TripModel> trips): _trips = trips;
  

 final  List<TripModel> _trips;
 List<TripModel> get trips {
  if (_trips is EqualUnmodifiableListView) return _trips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trips);
}


/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTripsWithUserSuccessCopyWith<GetTripsWithUserSuccess> get copyWith => _$GetTripsWithUserSuccessCopyWithImpl<GetTripsWithUserSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTripsWithUserSuccess&&const DeepCollectionEquality().equals(other._trips, _trips));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_trips));

@override
String toString() {
  return 'TripState.getTripsWithUserSuccess(trips: $trips)';
}


}

/// @nodoc
abstract mixin class $GetTripsWithUserSuccessCopyWith<$Res> implements $TripStateCopyWith<$Res> {
  factory $GetTripsWithUserSuccessCopyWith(GetTripsWithUserSuccess value, $Res Function(GetTripsWithUserSuccess) _then) = _$GetTripsWithUserSuccessCopyWithImpl;
@useResult
$Res call({
 List<TripModel> trips
});




}
/// @nodoc
class _$GetTripsWithUserSuccessCopyWithImpl<$Res>
    implements $GetTripsWithUserSuccessCopyWith<$Res> {
  _$GetTripsWithUserSuccessCopyWithImpl(this._self, this._then);

  final GetTripsWithUserSuccess _self;
  final $Res Function(GetTripsWithUserSuccess) _then;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trips = null,}) {
  return _then(GetTripsWithUserSuccess(
null == trips ? _self._trips : trips // ignore: cast_nullable_to_non_nullable
as List<TripModel>,
  ));
}


}

/// @nodoc


class CancelTripSuccess implements TripState {
  const CancelTripSuccess(this.trip);
  

 final  TripModel trip;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelTripSuccessCopyWith<CancelTripSuccess> get copyWith => _$CancelTripSuccessCopyWithImpl<CancelTripSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelTripSuccess&&(identical(other.trip, trip) || other.trip == trip));
}


@override
int get hashCode => Object.hash(runtimeType,trip);

@override
String toString() {
  return 'TripState.cancelTripSuccess(trip: $trip)';
}


}

/// @nodoc
abstract mixin class $CancelTripSuccessCopyWith<$Res> implements $TripStateCopyWith<$Res> {
  factory $CancelTripSuccessCopyWith(CancelTripSuccess value, $Res Function(CancelTripSuccess) _then) = _$CancelTripSuccessCopyWithImpl;
@useResult
$Res call({
 TripModel trip
});


$TripModelCopyWith<$Res> get trip;

}
/// @nodoc
class _$CancelTripSuccessCopyWithImpl<$Res>
    implements $CancelTripSuccessCopyWith<$Res> {
  _$CancelTripSuccessCopyWithImpl(this._self, this._then);

  final CancelTripSuccess _self;
  final $Res Function(CancelTripSuccess) _then;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trip = null,}) {
  return _then(CancelTripSuccess(
null == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripModel,
  ));
}

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripModelCopyWith<$Res> get trip {
  
  return $TripModelCopyWith<$Res>(_self.trip, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}

/// @nodoc


class GetTripsWithHostSuccess implements TripState {
  const GetTripsWithHostSuccess(final  List<TripModel> trips): _trips = trips;
  

 final  List<TripModel> _trips;
 List<TripModel> get trips {
  if (_trips is EqualUnmodifiableListView) return _trips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trips);
}


/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTripsWithHostSuccessCopyWith<GetTripsWithHostSuccess> get copyWith => _$GetTripsWithHostSuccessCopyWithImpl<GetTripsWithHostSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTripsWithHostSuccess&&const DeepCollectionEquality().equals(other._trips, _trips));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_trips));

@override
String toString() {
  return 'TripState.getTripsWithHostSuccess(trips: $trips)';
}


}

/// @nodoc
abstract mixin class $GetTripsWithHostSuccessCopyWith<$Res> implements $TripStateCopyWith<$Res> {
  factory $GetTripsWithHostSuccessCopyWith(GetTripsWithHostSuccess value, $Res Function(GetTripsWithHostSuccess) _then) = _$GetTripsWithHostSuccessCopyWithImpl;
@useResult
$Res call({
 List<TripModel> trips
});




}
/// @nodoc
class _$GetTripsWithHostSuccessCopyWithImpl<$Res>
    implements $GetTripsWithHostSuccessCopyWith<$Res> {
  _$GetTripsWithHostSuccessCopyWithImpl(this._self, this._then);

  final GetTripsWithHostSuccess _self;
  final $Res Function(GetTripsWithHostSuccess) _then;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trips = null,}) {
  return _then(GetTripsWithHostSuccess(
null == trips ? _self._trips : trips // ignore: cast_nullable_to_non_nullable
as List<TripModel>,
  ));
}


}

/// @nodoc


class CompleteTripSuccess implements TripState {
  const CompleteTripSuccess(this.trip);
  

 final  TripModel trip;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteTripSuccessCopyWith<CompleteTripSuccess> get copyWith => _$CompleteTripSuccessCopyWithImpl<CompleteTripSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteTripSuccess&&(identical(other.trip, trip) || other.trip == trip));
}


@override
int get hashCode => Object.hash(runtimeType,trip);

@override
String toString() {
  return 'TripState.completeTripSuccess(trip: $trip)';
}


}

/// @nodoc
abstract mixin class $CompleteTripSuccessCopyWith<$Res> implements $TripStateCopyWith<$Res> {
  factory $CompleteTripSuccessCopyWith(CompleteTripSuccess value, $Res Function(CompleteTripSuccess) _then) = _$CompleteTripSuccessCopyWithImpl;
@useResult
$Res call({
 TripModel trip
});


$TripModelCopyWith<$Res> get trip;

}
/// @nodoc
class _$CompleteTripSuccessCopyWithImpl<$Res>
    implements $CompleteTripSuccessCopyWith<$Res> {
  _$CompleteTripSuccessCopyWithImpl(this._self, this._then);

  final CompleteTripSuccess _self;
  final $Res Function(CompleteTripSuccess) _then;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trip = null,}) {
  return _then(CompleteTripSuccess(
null == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripModel,
  ));
}

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripModelCopyWith<$Res> get trip {
  
  return $TripModelCopyWith<$Res>(_self.trip, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}

// dart format on
