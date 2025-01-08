import 'package:flutter/material.dart';
import 'package:helpy/constants/colors.dart';
import 'package:helpy/sesion/login.dart';
import 'package:helpy/sesion/register.dart';
import 'dart:ui';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.blueColor
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
bool mostrarSesion = false;
bool mostrarRegister = false;
bool barrier = true;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _setStateLogin(){
    setState(() {
      mostrarSesion = true;
      mostrarRegister = false;
    });
  }
  
  // void _showContainerLogin(){
  //   ContainerSesion(
  //     mostrarSesion: mostrarSesion,
  //     onDismissed: () {
  //       setState(() {
  //         mostrarSesion = false;
  //         // mostrarRegister = false;
  //       });
  //     },
  //   );
  // }
  
  // void _showContainerRegister(){
  //   ContainerRegister(
  //     mostrarRegister: mostrarRegister,
  //     onDismissed: () {
  //       setState(() {
  //         mostrarRegister = false;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {

    String _valorBuscador = '';

    return Scaffold(

      // Nav bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            
            // Helpy Logo
            SizedBox(
              width: 120,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image(
                    image: AssetImage('assets/logo/image.png'),
                  ),
              ),
            ),

            //Login button
            SizedBox(
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  textStyle: TextStyle(
                    fontWeight:FontWeight.w400,
                    fontSize: 20
                  )
                ),
                onPressed: () {
                  _setStateLogin();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      // backgroundColor: Colors.transparent,
                      // alignment: Alignment.bottomCenter,
                      key: Key('dialog'),
                      child: 
                        mostrarSesion == true ?
                        ContainerSesion(
                          mostrarSesion: mostrarSesion,
                          onDismissed: () {
                            setState(() {
                              mostrarSesion = false;
                              barrier = false;
                            });
                            print('mostrarSesion: $mostrarSesion');
                          },
                        )
                        :
                        ContainerRegister(
                          mostrarRegister: true,
                          onDismissed: () {
                            setState(() {
                              mostrarRegister = false;
                            });
                          },
                        ),
                    ),
                    
                  );
                },
                icon:Icon(
                  Icons.login,
                  size: 20,
                ),
                iconAlignment: IconAlignment.end,
                label: Text(
                  "Iniciar sesion",
                  textAlign: TextAlign.center,
                ),
              ),
            )
            
          ],
        )
      ),
      
      // Menu principal
      body: Center(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 200,
          left: 200,
          right: 200,
          top: 100
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                  textAlign: TextAlign.center,
                  "Busca el servicio que necesites, encuentra al proveedor ideal",
                ),
              ),
              // Barra de búsqueda con ancho relativo al padre
              SizedBox(
                height: 80, // Altura deseada para la barra
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Row(
                    children: [
                      Expanded(
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
                              _valorBuscador = value;
                              print(_valorBuscador);
                            });
                          },
                        ),
                      ),
                      TextButton.icon(
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
                            size: 47,
                          ),
                        ),
                        label: Text(""),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


