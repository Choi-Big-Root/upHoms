import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/property/property_model.dart';
import '../../../domain/usecases/property/add_property_usecase.dart';
import '../../../domain/usecases/property/get_all_properties_usecase.dart';
import '../../../domain/usecases/property/get_property_usecase.dart';
import '../../../domain/usecases/property/get_search_propertiesa_usecase.dart';
import '../../../domain/usecases/property/update_property_usecase.dart';

part 'property_event.bloc.dart';
part 'property_state.bloc.dart';
part 'property_bloc.bloc.freezed.dart';


class PropertyBloc extends Bloc<PropertyEvent,PropertyState> {
  final AddPropertyUsecase _addPropertyUsecase;
  final GetAllPropertiesUsecase _getAllPropertiesUsecase; // 추가
  final GetSearchPropertiesUsecase _getSearchPropertiesUsecase;
  final GetPropertyUsecase _getPropertyUsecase;
  final UpdatePropertyUsecase _updatePropertyUsecase;

  PropertyBloc({
    required AddPropertyUsecase addPropertyUsecase,
    required GetAllPropertiesUsecase getAllPropertiesUsecase, // 추가
    required GetSearchPropertiesUsecase getSearchPropertiesUsecase, // 추가
    required GetPropertyUsecase getPropertyUsecase,
    required UpdatePropertyUsecase updatePropertyUsecase,
  }) : _addPropertyUsecase = addPropertyUsecase,
       _getAllPropertiesUsecase = getAllPropertiesUsecase, // 추가
        _getSearchPropertiesUsecase = getSearchPropertiesUsecase, // 추가
        _getPropertyUsecase = getPropertyUsecase,
  _updatePropertyUsecase = updatePropertyUsecase,
  super(const PropertyState.initial()){
    on<AddProperty>(_onAddProperty);
    on<EditingProperty>(_onEditingProperty);
    on<LoadProperties>(_onLoadProperties); // 추가
    on<LoadSearchProperties>(_onLoadSearchProperties);
    on<LoadProperty>(_onLoadProperty);
    on<UpdateProperty>(_onUpdateProperty);
  }

  Future<void> _onAddProperty(AddProperty event, Emitter<PropertyState> emit) async {
    emit(const PropertyState.loading());
    try {
      await _addPropertyUsecase(event.propertyModel);
      emit(const PropertyState.success());
      final properties = await _getAllPropertiesUsecase();
      emit(PropertyState.propertiesLoaded(properties));
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

  Future<void> _onLoadProperties(LoadProperties event, Emitter<PropertyState> emit) async {
    emit(const PropertyState.loading());
    try {
      final properties = await _getAllPropertiesUsecase();
      emit(PropertyState.propertiesLoaded(properties));
    } catch (e) {
      emit(PropertyState.error(e.toString()));
    }
  }

  Future<void> _onLoadSearchProperties(LoadSearchProperties event, Emitter<PropertyState> emit) async {
    emit(const PropertyState.loading());
    try {
      final properties = await _getSearchPropertiesUsecase(event.searchText);
      emit(PropertyState.searchPropertiesLoaded(properties));
    } catch (e) {
      emit(PropertyState.error(e.toString()));
    }
  }

  Future<void> _onLoadProperty(LoadProperty event, Emitter<PropertyState> emit) async {
    emit(const PropertyState.loading());
    try {
      final property = await _getPropertyUsecase(event.propertyId);
      emit(PropertyState.propertyLoaded(property));
    } catch (e) {
      emit(PropertyState.error(e.toString()));
    }
  }

  Future<void> _onUpdateProperty(UpdateProperty event, Emitter<PropertyState> emit) async {
    emit(const PropertyState.loading());
    try {
      await _updatePropertyUsecase(event.property);
      emit(const PropertyState.success());
      final properties = await _getAllPropertiesUsecase();
      emit(PropertyState.propertiesLoaded(properties));
    } catch (e) {
      emit(PropertyState.error(e.toString()));
    }
  }

}
