import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_event.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_state.dart';
import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/models/species_model.dart';
import 'package:pry_mascotas/services/remote/firestore_service.dart';

class AddPetBloc extends Bloc<AddPetEvent, AddPetState> {
  AddPetBloc() : super(AddPetInitState()) {
    PetModel? petModel;
    List<EspeciesRazasModel>? especiesRazas;
    FirestoreService firestoreService = FirestoreService();
    List<String> razas;
    on<AddPetGetDataEvent>(
      (event, emit) async {
        emit(AddPetLoadingState());
        especiesRazas = await firestoreService.getAllSpeciesRaza();
        if (especiesRazas != null) {
          emit(AddPetGetDataState(especiesRazas: especiesRazas!));
        } else {
          emit(AddPetErrorState(message: "Error al cargar especies y razas"));
        }
      },
    );

    on<AddPetChangeEspecieEvent>(
      (event, emit) {
        razas = event.especiesRazas
            .where((element) => element.idespecie == event.idespecie)
            .first
            .razas;
        if (razas.isNotEmpty) {
          emit(AddPetChangeEspecieState(
              especiesRazas: event.especiesRazas,
              razas: razas,
              idespecie: event.idespecie));
        } else {
          emit(AddPetErrorState(message: "Error al cargar razas"));
        }
      },
    );
  }
}
