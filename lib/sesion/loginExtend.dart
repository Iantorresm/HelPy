import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerSesionExtend extends StatefulWidget {
  final VoidCallback onDismissed;

  const ContainerSesionExtend({super.key, required this.onDismissed});

  @override
  State<ContainerSesionExtend> createState() => _ContainerSesionState();
}

class _ContainerSesionState extends State<ContainerSesionExtend> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Dismissible(
              onDismissed: (direction) {
                widget.onDismissed();
              },
              key: const ValueKey('containerSesion'),
              direction: DismissDirection.vertical,
              child: Container(
                width: 600,
                height: 560,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Container(
                    width: 600-70,
                    height: 570-70,
                    decoration: BoxDecoration(
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(209, 209, 209, 1),
                          ), 
                        ),
                        // Por que hay dos SizedBox? No preguntes, funciona
                        // SizedBox(width: 300,)0,
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Ya casi termina tu registro",
                              style: GoogleFonts.imprima(
                                color: Colors.black,
                                fontSize: 20
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 27,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Nombre",
                                    style: GoogleFonts.imprima(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 13,),
                                SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: TextField( 
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      hintText: 'Ingrese su nombre',
                                      hintStyle: GoogleFonts.imprima(),
                                      fillColor: Colors.black,
                                    ),
                                    onChanged: (value){
                                      print(value);
                                    },
                                  ),
                                ),
                              ]
                            ),
                            SizedBox(height: 13,width: 30,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Apellido",
                                    style: GoogleFonts.imprima(
                                      color: Colors.black,
                                      fontSize: 20
                                    ),
                                  ),
                                ),
                                SizedBox(height: 13,),
                                SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    hintText: 'Ingrese su apellido',
                                    hintStyle: GoogleFonts.imprima(),
                                    fillColor: Colors.black,
                                    ),
                                    onChanged: (value){
                                      print(value);
                                    },
                                  ),
                                ),
                              ]
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 13,),
                        Row(
                          children: [
                            Wrap(
                              children: [
                                Icon(Icons.location_on_outlined,size: 27,),
                                Text(
                                  " Direccion",
                                  style: GoogleFonts.imprima(
                                    color: Colors.black,
                                    fontSize: 20
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 13,),
                        TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: 'Ingrese su direccion',
                          hintStyle: GoogleFonts.imprima(),
                          fillColor: Colors.black,
                          ),
                          onChanged: (value){
                            print(value);
                          },
                        ),
                        SizedBox(height: 13,),
                        Row(
                          children: [
                            Wrap(
                              children: [
                                Icon(Icons.phone_android_outlined,size: 27,),
                                Text(
                                  "Telefono",
                                  style: GoogleFonts.imprima(
                                    color: Colors.black,
                                    fontSize: 20
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 13,),
                        TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: 'Ingrese su telefono',
                          hintStyle: GoogleFonts.imprima(),
                          fillColor: Colors.black,
                          ),
                          onChanged: (value){
                            print(value);
                          },
                        ),
                        SizedBox(height: 40,),
                        SizedBox(height: 20,),
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Color.fromRGBO(244, 196, 48, 1)),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)
                                  ),
                                ),
                                padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 15, 0, 15)),
                              ),
                              child: Text(
                                'Ingresar',
                                style: GoogleFonts.imprima(
                                  color: Colors.black,
                                  fontSize: 20
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}