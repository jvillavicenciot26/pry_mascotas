import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_event.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_state.dart';
import 'package:pry_mascotas/models/species_model.dart';
import 'package:pry_mascotas/services/remote/firestorage_service.dart';
import 'package:pry_mascotas/services/remote/firestore_service.dart';

class AddPetBloc extends Bloc<AddPetEvent, AddPetState> {
  AddPetBloc() : super(AddPetInitState()) {
    //PetModel? petModel;
    List<EspeciesRazasModel> especiesRazas;
    FirestoreService firestoreService = FirestoreService();
    List<String> razas;
    FirestorageService firestorageService = FirestorageService();
    String urlImage = "";

    on<AddPetGetDataEvent>(
      (event, emit) async {
        emit(AddPetLoadingState());
        especiesRazas = await firestoreService.getAllSpeciesRaza();
        if (especiesRazas.isNotEmpty) {
          emit(AddPetGetDataState(
            especiesRazas: especiesRazas,
            idespecie: event.idespecie ?? especiesRazas.first.idespecie,
            razas: event.idespecie == null
                ? especiesRazas.first.razas
                : especiesRazas
                    .where((element) => element.idespecie == event.idespecie)
                    .first
                    .razas,
            idraza: event.idraza ?? especiesRazas.first.razas.first,
            idgenero: event.idgenero ?? "Hembra",
          ));
        } else {
          emit(AddPetErrorState(message: "Error al cargar especies y razas"));
        }
      },
    );

    on<AddPetChangeEspecieEvent>(
      (event, emit) {
        emit(AddPetLoadingState());
        razas = event.especiesRazas
            .where((element) => element.idespecie == event.idespecie)
            .first
            .razas;
        if (razas.isNotEmpty) {
          emit(AddPetChangeEspecieState(
            especiesRazas: event.especiesRazas,
            razas: razas,
            idespecie: event.idespecie,
            idraza: razas.first,
            idgenero: event.idgenero,
          ));
        } else {
          emit(AddPetErrorState(message: "Error al cargar razas"));
        }
      },
    );

    on<AddPetChangeRazaEvent>(
      (event, emit) {
        emit(AddPetChangeRazaState(
          especiesRazas: event.especiesRazas,
          idespecie: event.idespecie,
          idraza: event.idraza,
          razas: event.razas,
          idgenero: event.idgenero,
        ));
      },
    );

    on<AddPetChangeGenreEvent>(
      (event, emit) {
        emit(AddPetChangeGenreState(
          especiesRazas: event.especiesRazas,
          idespecie: event.idespecie,
          razas: event.razas,
          idraza: event.idraza,
          idgenero: event.idgenero,
        ));
      },
    );

    on<AddPetCreateEvent>(
      (event, emit) async {
        emit(AddPetLoadingState());
        if (event.image != null) {
          urlImage = await firestorageService.uploadImageStorage(event.image);
          event.pet.imagen = urlImage;
        }
        firestoreService.registerPet(event.pet);
        emit(AddPetSuccedState(message: "Registro de mascota exitoso."));
      },
    );

    on<AddPetUpdateEvent>(
      (event, emit) async {
        emit(AddPetLoadingState());
        print(event.image);
        if (event.image != null) {
          urlImage = await firestorageService.uploadImageStorage(event.image,
              urlImage: event.urlImage);
          event.pet.imagen = urlImage;
        }

        firestoreService.updatePet(event.pet);
        emit(AddPetSuccedState(message: "Actualización de mascota exitosa."));
      },
    );
  }
}
