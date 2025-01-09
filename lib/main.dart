import 'package:flutter/material.dart';
import 'package:helpy/constants/colors.dart';
import 'package:helpy/ui/navigation/navigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  

  @override
  Widget build(BuildContext context) {

    String valorBuscador = '';

    return Scaffold(

      // Nav bar
      appBar: NavBar(context,_login),
      
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
                              valorBuscador = value;
                              print(valorBuscador);
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


