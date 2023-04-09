import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pry_mascotas/models/user_model.dart';

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

  Future<String> registerUser(UserModel model) async {
    CollectionReference userReference =
        FirebaseFirestore.instance.collection("usuarios");

    DocumentReference doc = await userReference.add(model.toJson());
    //print(doc.id);
    return doc.id;
  }
}
