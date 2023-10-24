// ignore_for_file: file_names, non_constant_identifier_names

class UsuarioModel {
  int usr_codigo;
  String usr_id;
  String usr_nombre;
  int usr_inactivo;
  String usr_clave;
  String usr_rol_web;

  UsuarioModel({
    required this.usr_codigo,
    required this.usr_id,
    required this.usr_nombre,
    required this.usr_inactivo,
    required this.usr_clave,
    required this.usr_rol_web,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      usr_codigo: json['usr_codigo'],
      usr_id: json['usr_id'],
      usr_nombre: json['usr_nombre'],
      usr_inactivo: json['usr_inactivo'],
      usr_clave: json['usr_clave'],
      usr_rol_web: json['usr_rol_web'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usr_codigo': usr_codigo,
      'usr_id': usr_id,
      'usr_nombre': usr_nombre,
      'usr_inactivo': usr_inactivo,
      'usr_clave': usr_clave,
      'usr_rol_web': usr_rol_web,
    };
  }
}
