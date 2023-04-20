class PetModel {
  PetModel({
    required this.color,
    required this.edad,
    this.id,
    required this.especie,
    this.imagen,
    required this.nombre,
    required this.raza,
  });

  String color;
  double edad;
  String? id;
  String especie;
  String? imagen;
  String nombre;
  String raza;

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        color: json["color"],
        edad: json["edad"].toDouble(),
        especie: json["especie"],
        //id: json["id"] ? "" : json["id"],
        imagen: json["imagen"] ?? "",
        nombre: json["nombre"],
        raza: json["raza"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "edad": edad,
        "especie": especie,
        //"id": id,
        "imagen": imagen,
        "nombre": nombre,
        "raza": raza,
      };
}
