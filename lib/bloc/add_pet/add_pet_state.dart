import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/models/species_model.dart';

abstract class AddPetState {
  PetModel? petModel;
  AddPetState({this.petModel});
}

class AddPetInitState extends AddPetState {}

class AddPetLoadingState extends AddPetState {}

class AddPetGetDataState extends AddPetState {
  List<EspeciesRazasModel> especiesRazas;
  AddPetGetDataState({required this.especiesRazas});
}

class AddPetChangeEspecieState extends AddPetState {
  List<EspeciesRazasModel> especiesRazas;
  List<String> razas;
  String idespecie;
  AddPetChangeEspecieState(
      {required this.especiesRazas,
      required this.razas,
      required this.idespecie});
}

class AddPetChangeRazaState extends AddPetState {}

class AddPetSuccedState extends AddPetState {
  String message;
  AddPetSuccedState({required this.message});
}

class AddPetErrorState extends AddPetState {
  String message;
  AddPetErrorState({required this.message});
}
