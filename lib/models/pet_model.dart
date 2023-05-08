import 'package:cloud_firestore/cloud_firestore.dart';

class PetModel {
  PetModel({
    required this.color,
    this.id,
    required this.especie,
    this.imagen,
    required this.nombre,
    required this.raza,
    required this.genero,
    required this.fecnac,
    required this.usuario,
  });

  String color;
  String? id;
  String especie;
  String? imagen;
  String nombre;
  String raza;
  String genero;
  //String fecnac;
  Timestamp fecnac;
  String usuario;

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        color: json["color"],
        especie: json["especie"],
        //id: json["id"] ? "" : json["id"],
        imagen: json["imagen"] ?? "",
        nombre: json["nombre"],
        raza: json["raza"],
        genero: json["genero"],
        //fecnac: json["fecnac"],
        fecnac: json["fecnac"],
        usuario: json["usuario"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "especie": especie,
        //"id": id,
        "imagen": imagen,
        "nombre": nombre,
        "raza": raza,
        "genero": genero,
        "fecnac": fecnac,
        "usuario": usuario,
      };
}
