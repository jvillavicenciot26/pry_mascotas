import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';

class FirestorageService {
  Future<String> uploadImageStorage(XFile? image, {String? urlImage}) async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    if (urlImage != null) {
      await storage.refFromURL(urlImage).delete();
    }

    firebase_storage.Reference referenceStorage =
        storage.ref().child(SPGlobal().id).child("pets");

    String name = DateTime.now().toString();
    String temp = mime(image!.path) ?? "";
    String extension = temp.split("/")[1];

    firebase_storage.TaskSnapshot uploadTask = await referenceStorage
        .child("$name.$extension")
        .putFile(File(image!.path));

    return await uploadTask.ref.getDownloadURL();
  }
}
