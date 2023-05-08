import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/models/species_model.dart';
import 'package:pry_mascotas/models/user_model.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';

class FirestoreService {
  Future<UserModel?> getUser(String email) async {
    CollectionReference userReference =
        FirebaseFirestore.instance.collection("usuarios");

    QuerySnapshot collection =
        await userReference.where("email", isEqualTo: email).get();

    if (collection.size > 0) {
      QueryDocumentSnapshot doc = collection.docs.first;
      UserModel model = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      model.id = doc.id;
      return model;
    }
    return null;
  }

  Future<UserModel?> getUserById(String id) async {
    CollectionReference userReference =
        FirebaseFirestore.instance.collection("usuarios");

    DocumentSnapshot doc = await userReference.doc(id).get();
    //print(doc.data() as Map<String, dynamic>);
    if (doc.exists) {
      UserModel model = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      model.id = doc.id;
      return model;
    }
    return null;
  }

  Future<List<PetModel>> getPetsByUser(String id) async {
    CollectionReference petsReference =
        FirebaseFirestore.instance.collection("mascota");

    QuerySnapshot collection =
        await petsReference.where("usuario", isEqualTo: SPGlobal().id).get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<PetModel> petsModel = [];
    for (QueryDocumentSnapshot item in docs) {
      Map<String, dynamic> data = item.data() as Map<String, dynamic>;
      PetModel petModel =
          PetModel.fromJson(item.data() as Map<String, dynamic>);
      petModel.id = item.id;
      petsModel.add(petModel);
    }
    return petsModel;
  }

  //Future<List<String>> getSpecieyRaza(String idEspecie, String idRaza) async {
  Future<List<String>> getSpecieyRaza(String idEspecie) async {
    CollectionReference specieRazaReference =
        FirebaseFirestore.instance.collection("especies");

    DocumentSnapshot doc = await specieRazaReference.doc(idEspecie).get();
    List<String> data = [];

    if (doc.exists) {
      Map<String, dynamic> especie = doc.data() as Map<String, dynamic>;
      //print(especie["razas"]);
      data.add(especie["nombre"]);
      //data.add(especie["razas"][idRaza]);
    }
    return data;
  }

  Future<List<EspeciesRazasModel>> getAllSpeciesRaza() async {
    CollectionReference allSpecieRaza =
        FirebaseFirestore.instance.collection("especies");

    QuerySnapshot collection = await allSpecieRaza.get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<EspeciesRazasModel> especiesRazas = [];
    for (QueryDocumentSnapshot item in docs) {
      //print(item.data() as Map<String, dynamic>);
      EspeciesRazasModel especieRaza =
          EspeciesRazasModel.fromJson(item.data() as Map<String, dynamic>);
      especieRaza.idespecie = item.id;
      especiesRazas.add(especieRaza);
    }
    return especiesRazas;
  }

  Future<String> registerUser(UserModel model) async {
    CollectionReference userReference =
        FirebaseFirestore.instance.collection("usuarios");

    DocumentReference doc = await userReference.add(model.toJson());
    //print(doc.id);
    return doc.id;
  }

  registerPet(PetModel pet) async {
    CollectionReference petReference =
        FirebaseFirestore.instance.collection("mascota");
    await petReference.add(pet.toJson());
  }

  updatePet(PetModel pet) async {
    CollectionReference petReference =
        FirebaseFirestore.instance.collection("mascota");
    print(pet.imagen);
    print(pet.fecnac.toDate().toString());
    print(pet.toJson());
    await petReference.doc(pet.id).update(pet.toJson());
  }
}
