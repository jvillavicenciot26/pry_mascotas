import 'package:pry_mascotas/models/species_model.dart';

abstract class AddPetEvent {}

class AddPetGetDataEvent extends AddPetEvent {}

class AddPetChangeEspecieEvent extends AddPetEvent {
  List<EspeciesRazasModel> especiesRazas;
  String idespecie;
  AddPetChangeEspecieEvent(
      {required this.especiesRazas, required this.idespecie});
}

class AddPetChangeRazaEvent extends AddPetEvent {}

class AddPetSaveEvent extends AddPetEvent {}
