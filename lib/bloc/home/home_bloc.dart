import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pry_mascotas/bloc/home/home_event.dart';
import 'package:pry_mascotas/bloc/home/home_state.dart';
import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/models/species_model.dart';
import 'package:pry_mascotas/models/user_model.dart';
import 'package:pry_mascotas/services/remote/firestore_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitState()) {
    FirestoreService firestoreService = FirestoreService();
    UserModel? userModel;
    List<PetModel>? petModel;
    List<EspeciesRazasModel> especiesRazasModel;
    on<HomeGetProfileEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        userModel = await firestoreService.getUserById(event.id);
        petModel = await firestoreService.getPetsByUser(event.id);
        especiesRazasModel = await firestoreService.getAllSpeciesRaza();
        if (userModel != null) {
          emit(HomeGetProfileState(
              userModel: userModel,
              petsModel: petModel,
              especiesRazaModel: especiesRazasModel));
        } else {
          emit(HomeErrorState(userModel: null));
        }
      },
    );
  }
}
