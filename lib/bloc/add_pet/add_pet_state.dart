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
  String? idespecie;
  List<String> razas;
  String idraza;
  String idgenero;
  AddPetGetDataState({
    required this.especiesRazas,
    this.idespecie,
    required this.razas,
    required this.idraza,
    required this.idgenero,
  });
}

class AddPetChangeEspecieState extends AddPetState {
  List<EspeciesRazasModel> especiesRazas;
  String idespecie;
  List<String> razas;
  String idraza;
  String idgenero;
  AddPetChangeEspecieState({
    required this.especiesRazas,
    required this.idespecie,
    required this.razas,
    required this.idraza,
    required this.idgenero,
  });
}

class AddPetChangeRazaState extends AddPetState {
  List<EspeciesRazasModel> especiesRazas;
  String idespecie;
  List<String> razas;
  String idraza;
  String idgenero;
  AddPetChangeRazaState({
    required this.especiesRazas,
    required this.idespecie,
    required this.razas,
    required this.idraza,
    required this.idgenero,
  });
}

class AddPetChangeGenreState extends AddPetState {
  List<EspeciesRazasModel> especiesRazas;
  String idespecie;
  List<String> razas;
  String idraza;
  String idgenero;
  AddPetChangeGenreState({
    required this.especiesRazas,
    required this.idespecie,
    required this.razas,
    required this.idraza,
    required this.idgenero,
  });
}

class AddPetSuccedState extends AddPetState {
  String message;
  AddPetSuccedState({required this.message});
}

class AddPetErrorState extends AddPetState {
  String message;
  AddPetErrorState({required this.message});
}
