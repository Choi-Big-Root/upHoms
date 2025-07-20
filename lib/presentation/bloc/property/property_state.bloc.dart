part of 'property_bloc.bloc.dart';

@freezed
class PropertyState with _$PropertyState {
  const factory PropertyState.initial() = Initial;
  const factory PropertyState.loading() = Loading;
  const factory PropertyState.success() = Created;
  const factory PropertyState.error(String message) = Error;
}