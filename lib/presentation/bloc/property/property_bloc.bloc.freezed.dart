// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_bloc.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PropertyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PropertyState()';
}


}

/// @nodoc
class $PropertyStateCopyWith<$Res>  {
$PropertyStateCopyWith(PropertyState _, $Res Function(PropertyState) __);
}


/// Adds pattern-matching-related methods to [PropertyState].
extension PropertyStatePatterns on PropertyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Created value)?  success,TResult Function( Error value)?  error,TResult Function( Editing value)?  editing,TResult Function( PropertiesLoaded value)?  propertiesLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Created() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case Editing() when editing != null:
return editing(_that);case PropertiesLoaded() when propertiesLoaded != null:
return propertiesLoaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Created value)  success,required TResult Function( Error value)  error,required TResult Function( Editing value)  editing,required TResult Function( PropertiesLoaded value)  propertiesLoaded,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Created():
return success(_that);case Error():
return error(_that);case Editing():
return editing(_that);case PropertiesLoaded():
return propertiesLoaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Created value)?  success,TResult? Function( Error value)?  error,TResult? Function( Editing value)?  editing,TResult? Function( PropertiesLoaded value)?  propertiesLoaded,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Created() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case Editing() when editing != null:
return editing(_that);case PropertiesLoaded() when propertiesLoaded != null:
return propertiesLoaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,TResult Function( PropertyModel property)?  editing,TResult Function( List<PropertyModel> properties)?  propertiesLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Created() when success != null:
return success();case Error() when error != null:
return error(_that.message);case Editing() when editing != null:
return editing(_that.property);case PropertiesLoaded() when propertiesLoaded != null:
return propertiesLoaded(_that.properties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,required TResult Function( PropertyModel property)  editing,required TResult Function( List<PropertyModel> properties)  propertiesLoaded,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Created():
return success();case Error():
return error(_that.message);case Editing():
return editing(_that.property);case PropertiesLoaded():
return propertiesLoaded(_that.properties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,TResult? Function( PropertyModel property)?  editing,TResult? Function( List<PropertyModel> properties)?  propertiesLoaded,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Created() when success != null:
return success();case Error() when error != null:
return error(_that.message);case Editing() when editing != null:
return editing(_that.property);case PropertiesLoaded() when propertiesLoaded != null:
return propertiesLoaded(_that.properties);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements PropertyState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PropertyState.initial()';
}


}




/// @nodoc


class Loading implements PropertyState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PropertyState.loading()';
}


}




/// @nodoc


class Created implements PropertyState {
  const Created();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Created);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PropertyState.success()';
}


}




/// @nodoc


class Error implements PropertyState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of PropertyState
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
  return 'PropertyState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $PropertyStateCopyWith<$Res> {
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

/// Create a copy of PropertyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Editing implements PropertyState {
  const Editing(this.property);
  

 final  PropertyModel property;

/// Create a copy of PropertyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditingCopyWith<Editing> get copyWith => _$EditingCopyWithImpl<Editing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Editing&&(identical(other.property, property) || other.property == property));
}


@override
int get hashCode => Object.hash(runtimeType,property);

@override
String toString() {
  return 'PropertyState.editing(property: $property)';
}


}

/// @nodoc
abstract mixin class $EditingCopyWith<$Res> implements $PropertyStateCopyWith<$Res> {
  factory $EditingCopyWith(Editing value, $Res Function(Editing) _then) = _$EditingCopyWithImpl;
@useResult
$Res call({
 PropertyModel property
});


$PropertyModelCopyWith<$Res> get property;

}
/// @nodoc
class _$EditingCopyWithImpl<$Res>
    implements $EditingCopyWith<$Res> {
  _$EditingCopyWithImpl(this._self, this._then);

  final Editing _self;
  final $Res Function(Editing) _then;

/// Create a copy of PropertyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? property = null,}) {
  return _then(Editing(
null == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as PropertyModel,
  ));
}

/// Create a copy of PropertyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PropertyModelCopyWith<$Res> get property {
  
  return $PropertyModelCopyWith<$Res>(_self.property, (value) {
    return _then(_self.copyWith(property: value));
  });
}
}

/// @nodoc


class PropertiesLoaded implements PropertyState {
  const PropertiesLoaded(final  List<PropertyModel> properties): _properties = properties;
  

 final  List<PropertyModel> _properties;
 List<PropertyModel> get properties {
  if (_properties is EqualUnmodifiableListView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_properties);
}


/// Create a copy of PropertyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertiesLoadedCopyWith<PropertiesLoaded> get copyWith => _$PropertiesLoadedCopyWithImpl<PropertiesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertiesLoaded&&const DeepCollectionEquality().equals(other._properties, _properties));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_properties));

@override
String toString() {
  return 'PropertyState.propertiesLoaded(properties: $properties)';
}


}

/// @nodoc
abstract mixin class $PropertiesLoadedCopyWith<$Res> implements $PropertyStateCopyWith<$Res> {
  factory $PropertiesLoadedCopyWith(PropertiesLoaded value, $Res Function(PropertiesLoaded) _then) = _$PropertiesLoadedCopyWithImpl;
@useResult
$Res call({
 List<PropertyModel> properties
});




}
/// @nodoc
class _$PropertiesLoadedCopyWithImpl<$Res>
    implements $PropertiesLoadedCopyWith<$Res> {
  _$PropertiesLoadedCopyWithImpl(this._self, this._then);

  final PropertiesLoaded _self;
  final $Res Function(PropertiesLoaded) _then;

/// Create a copy of PropertyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? properties = null,}) {
  return _then(PropertiesLoaded(
null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as List<PropertyModel>,
  ));
}


}

// dart format on
