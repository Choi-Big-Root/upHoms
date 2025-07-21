import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/property/property_model.dart';
import '../../../domain/usecases/property/add_property_usecase.dart';

part 'property_event.bloc.dart';
part 'property_state.bloc.dart';

part 'property_bloc.bloc.freezed.dart';


class PropertyBloc extends Bloc<PropertyEvent,PropertyState> {
  final AddPropertyUsecase _addPropertyUsecase;

  PropertyBloc({required AddPropertyUsecase addPropertyUsecase }) : _addPropertyUsecase = addPropertyUsecase,
  super(const PropertyState.initial()){
    on<AddProperty>(_onAddProperty);
    on<EditingProperty>(_onEditingProperty);
  }

  Future<void> _onAddProperty(AddProperty event, Emitter<PropertyState> emit) async {
    emit(const PropertyState.loading());
    try {
      await _addPropertyUsecase(event.propertyModel);
      emit(const PropertyState.success());
    } catch (e) {
      emit(PropertyState.error(e.toString()));
    }
  }

  Future<void> _onEditingProperty(EditingProperty event, Emitter<PropertyState> emit) async {
    emit(const PropertyState.loading());
    try {
      emit(PropertyState.editing(event.propertyModel));
    } catch (e) {
      emit(PropertyState.error(e.toString()));
    }
  }
}