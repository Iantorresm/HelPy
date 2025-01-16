import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:helpy/models/prestadorServicios/prestador.dart';
import 'package:helpy/models/servicio/servicio.dart';
import 'package:helpy/ui/auth/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String valorBuscador = '';
  String path = "/home/santiagosotelo/Desktop/helpyflu/HelPy/lib/ui"; 
  

  @override
  Widget build(BuildContext context) {
    return home(context, valorBuscador);
  }

  Scaffold home(BuildContext context, String valorBuscador) {


   
    return Scaffold(
      appBar: navBar(context),
      body: buscadorMenu(context, valorBuscador),
    );
  }

  Center buscadorMenu(BuildContext context, String valorBuscador) {
    List<Prestador> getPrestadores(){
      const data = [
        {
            "nombre": "Mario",
            "apellido": "Toledo",
            "descripcion":"Mario Toledo es un prestador de servicios de reparacion de coches y neumaticos. Este es su perfil.",
            "direccion": "Calle 123",
            "telefono": "123456789",
            "servicios":[
                {
                    "nombre": "Cambio de neumatico",
                    "costo": 100000.0,
                    "descripcion": "Cambio de neumatico"
                },
                {
                    "nombre": "Reparacion",
                    "costo": 40000.0,
                    "descripcion": "Reparacion de coche"
                },
                {
                    "nombre": "Balanceo",
                    "costo": 70000.0,
                    "descripcion": "Descripcion del servicio 3"
                }
            ]
        },
        {
            "nombre": "Pedro",
            "apellido": "Perez",
            "direccion": "Calle 123",
            "descripcion":"Propietario de una gomería con años de experiencia especializado en brindar soluciones rápidas y de calidad, priorizando la seguridad y satisfacción de sus clientes",
            "telefono": "123456789",
            "servicios":[
                {
                    "nombre": "Cambio de neumatico",
                    "costo": 100000.0,
                    "descripcion": "Cambio de neumatico"
                },
                {
                    "nombre": "Reparacion",
                    "costo": 40000.0,
                    "descripcion": "Reparacion de coche"
                },
                {
                    "nombre": "Balanceo",
                    "costo": 70000.0,
                    "descripcion": "Descripcion del servicio 3"
                }
            ]
        }
    ];
      
      return data.map<Prestador>(Prestador.fromJson).toList();
    }
    
    List<Prestador> prestadores = getPrestadores();
    
    return  Center(
      child: 
      Padding(
        padding: const EdgeInsets.only(
              left: 200,
              right: 200,
              top: 50
            ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.6,
                      child: Text(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                        textAlign: TextAlign.center,
                        "Busca el servicio que necesites, encuentra al proveedor ideal",
                      ),
                    ),
                  ),
                  // Barra de búsqueda con ancho relativo al padre
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25
                    ),
                    child: SizedBox(
                      height: 45, // Maxima altura
                      child: FractionallySizedBox(
                        widthFactor: 0.7,
                        heightFactor: 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: FractionallySizedBox(
                                heightFactor: 1,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: "¿En qué te ayudamos hoy?",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      valorBuscador = value;
                                      print(valorBuscador);
                                    });
                                  },
                                ),
                              ),
                            ),
                    
                    
                            FractionallySizedBox(
                              heightFactor: .96,
                              child: TextButton.icon(
                                style: TextButton.styleFrom(
                                  iconColor: Colors.white,
                                  backgroundColor: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20), // Esquina superior derecha redondeada
                                      bottomRight: Radius.circular(20), // Esquina inferior derecha redondeada
                                    ),
                                  ),
                                ),
                                icon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 27,
                                  ),
                                ),
                                label: Text(""),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: prestadores.length,
                itemBuilder: (context, index) {
                  final prestador = prestadores[index];
                  final servicios = prestadores[index].servicios;
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0, 
                      ),
                      borderRadius: BorderRadius.circular(10), 
                    ),
                    // child: ListTile(
                    //     leading: Image.asset(
                    //       "assets/example-icon-perfil.png",
                    //       width: 300,
                    //       height: 300,
                    //       ),
                    //     title: Text(
                    //       "${prestador.nombre} ${prestador.apellido}",
                    //       style: TextStyle(
                    //         fontSize: 30,
                    //         fontWeight: FontWeight.bold
                    //       ),
                    //     ),
                    //     subtitle: Column(
                    //       children:[
                    //         Row(
                    //           children: [
                    //             Expanded(
                    //               child: Text(
                    //                 prestador.descripcion,
                    //                 style:TextStyle(
                    //                   fontSize: 20,
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             for (var ser in servicios) Text(ser.nombre)
                    //           ],
                    //         ),
                    //       ] 
                    //     ),
                    //   ),
                  );
                },
              ),
            )
        
          ],
        ),
      ),

    );
  }

  AppBar navBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('assets/logo/image.png'),
            ),
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: LoginSesion(
                    onDismissed: () {
                      setState(() {});
                    },
                  ),
                ),
              );
            },
            icon: Icon(Icons.login, size: 20),
            label: Text(
              "Iniciar sesión",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
