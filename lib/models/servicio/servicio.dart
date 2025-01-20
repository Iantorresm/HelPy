class Servicio {
  final String nombre;
  final double costo;
  final String descripcion;

  Servicio({
    required this.nombre,
    required this.costo,
    required this.descripcion
  });

  static Servicio fromJson(json) => Servicio(
    nombre: json['nombre'],
    costo: json['costo'],
    descripcion: json['descripcion'],
  );

  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'costo': costo,
    'descripcion': descripcion,
  };
}