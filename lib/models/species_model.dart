class EspeciesRazasModel {
  String? idespecie;
  List<String> razas;
  String nombre;

  EspeciesRazasModel({
    this.idespecie,
    required this.razas,
    required this.nombre,
  });

  factory EspeciesRazasModel.fromJson(Map<String, dynamic> json) =>
      EspeciesRazasModel(
        razas: List<String>.from(json["razas"].map((x) => x)),
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "razas": List<dynamic>.from(razas.map((x) => x)),
        "nombre": nombre,
      };
}
