class UserModel {
  UserModel({
    required this.apellidoMaterno,
    required this.apellidoPaterno,
    required this.email,
    this.id,
    required this.imagen,
    required this.nombre,
    required this.telefono,
    required this.tipo,
  });

  String apellidoMaterno;
  String apellidoPaterno;
  String email;
  String? id;
  String imagen;
  String nombre;
  String telefono;
  String tipo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        apellidoMaterno: json["apellido_materno"],
        apellidoPaterno: json["apellido_paterno"],
        email: json["email"],
        //id: json["id"] ? "" : json["id"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "apellido_materno": apellidoMaterno,
        "apellido_paterno": apellidoPaterno,
        "email": email,
        //"id": id,
        "imagen": imagen,
        "nombre": nombre,
        "telefono": telefono,
        "tipo": tipo,
      };
}
