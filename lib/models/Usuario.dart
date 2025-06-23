// ignore_for_file: file_names, non_constant_identifier_names

class Usuario {
  int id;
  String username;
  String nombre;

  Usuario({
    required this.id,
    required this.username,
    required this.nombre
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      username: json['username'],
      nombre: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'nombre': nombre
    };
  }
}
