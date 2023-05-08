import 'package:image_picker/image_picker.dart';
import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/models/species_model.dart';

abstract class AddPetEvent {}

class AddPetGetDataEvent extends AddPetEvent {
  String? idespecie;
  String? idraza;
  String? idgenero;
  AddPetGetDataEvent({this.idespecie, this.idraza, this.idgenero});
}

class AddPetChangeEspecieEvent extends AddPetEvent {
  List<EspeciesRazasModel> especiesRazas;
  String idespecie;
  String idgenero;
  AddPetChangeEspecieEvent(
      {required this.especiesRazas,
      required this.idespecie,
      required this.idgenero});
}

class AddPetChangeRazaEvent extends AddPetEvent {
  List<EspeciesRazasModel> especiesRazas;
  String idespecie;
  List<String> razas;
  String idraza;
  String idgenero;
  AddPetChangeRazaEvent({
    required this.especiesRazas,
    required this.idespecie,
    required this.razas,
    required this.idraza,
    required this.idgenero,
  });
}

class AddPetChangeGenreEvent extends AddPetEvent {
  List<EspeciesRazasModel> especiesRazas;
  String idespecie;
  List<String> razas;
  String idraza;
  String idgenero;
  AddPetChangeGenreEvent({
    required this.especiesRazas,
    required this.idespecie,
    required this.razas,
    required this.idraza,
    required this.idgenero,
  });
}

class AddPetCreateEvent extends AddPetEvent {
  PetModel pet;
  XFile? image;
  AddPetCreateEvent({required this.pet, this.image});
}

class AddPetUpdateEvent extends AddPetEvent {
  PetModel pet;
  XFile? image;
  String? urlImage;
  AddPetUpdateEvent({required this.pet, this.image, this.urlImage});
}
