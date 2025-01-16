import 'package:helpy/models/servicio/servicio.dart';

class Prestador {
  final String nombre;
  final String apellido;
  final String direccion;
  final String descripcion;
  final String telefono;
  final List<Servicio> servicios;

  const Prestador({
    required this.nombre,
    required this.apellido,
    required this.direccion,
    required this.telefono,
    required this.servicios,
    required this.descripcion
  });

  

      
  static Prestador fromJson(json) => Prestador(
    nombre:json['nombre'],
    apellido:json['apellido'],
    direccion:json['direccion'],
    telefono:json['telefono'],
    descripcion:json['descripcion'],
    servicios:List<Servicio>.from(
      json['servicios'].map((x) => Servicio.fromJson(x)
    ))
  );

  Map<String,dynamic> toJson() => {
    'nombre': nombre,
    'apellido': apellido,
    'direccion': direccion,
    'telefono': telefono,
    'descripcion': descripcion,
    'servicios': List<dynamic>.from(servicios.map((x) => x.toJson())),
  };

}