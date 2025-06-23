class UsuarioRequest {
  final String nombreUsuario;
  final String clave;

  UsuarioRequest({
    required this.nombreUsuario,
    required this.clave,
  });

  factory UsuarioRequest.fromJson(Map<String, dynamic> json) {
    return UsuarioRequest(
        nombreUsuario: json['nombreUusario'],
        clave: json['clave']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombreUsuario': nombreUsuario,
      'clave': clave,
    };
  }
}