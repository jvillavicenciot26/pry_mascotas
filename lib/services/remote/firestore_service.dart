import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pry_mascotas/models/pet_model.dart';
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
      PetModel petModel =
          PetModel.fromJson(item.data() as Map<String, dynamic>);
      petModel.id = item.id;

      List<String> especieRaza =
          await getSpecieyRaza(petModel.especie, int.parse(petModel.raza));

      petModel.especie = especieRaza[0];
      petModel.raza = especieRaza[1];

      petsModel.add(petModel);
    }
    return petsModel;
  }

  Future<List<String>> getSpecieyRaza(String idEspecie, int idRaza) async {
    CollectionReference userReference =
        FirebaseFirestore.instance.collection("especies");

    DocumentSnapshot doc = await userReference.doc(idEspecie).get();
    List<String> data = [];
    if (doc.exists) {
      Map<String, dynamic> especie = doc.data() as Map<String, dynamic>;
      data.add(especie["nombre"]);
      data.add(especie["razas"][idRaza]);
    }
    return data;
  }

  Future<String> registerUser(UserModel model) async {
    CollectionReference userReference =
        FirebaseFirestore.instance.collection("usuarios");

    DocumentReference doc = await userReference.add(model.toJson());
    //print(doc.id);
    return doc.id;
  }
}
