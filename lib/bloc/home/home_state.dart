import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/models/species_model.dart';
import 'package:pry_mascotas/models/user_model.dart';

abstract class HomeState {
  UserModel? userModel;
  List<PetModel>? petsModel;
  HomeState({this.userModel, this.petsModel});
}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeGetProfileState extends HomeState {
  List<EspeciesRazasModel> especiesRazaModel;
  HomeGetProfileState(
      {required super.userModel,
      super.petsModel,
      required this.especiesRazaModel});
}

class HomeErrorState extends HomeState {
  HomeErrorState({required super.userModel});
}
