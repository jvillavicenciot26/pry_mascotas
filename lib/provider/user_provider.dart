import 'package:flutter/material.dart';
import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/models/user_model.dart';
import 'package:pry_mascotas/services/remote/firestore_service.dart';

class UserProvider extends ChangeNotifier {
  FirestoreService firestoreService = FirestoreService();
  UserModel? userModel;
  List<PetModel>? petsModel;

  getUserbyId(String id) async {
    userModel = await firestoreService.getUserById(id);
    notifyListeners();
  }

  getPetsbyUser(String id) async {
    petsModel = await firestoreService.getPetsByUser(id);
    notifyListeners();
  }
}
