import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpy/ui/auth/prototypeTextAndInput.dart';

class MoreRegisterNormal extends StatefulWidget {
  final VoidCallback onDismissed;

  const MoreRegisterNormal({super.key, required this.onDismissed});

  @override
  State<MoreRegisterNormal> createState() => _MoreRegisterNormalState();
}

class _MoreRegisterNormalState extends State<MoreRegisterNormal> {

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
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Container(
                    width: 400-70,
                    height: 670-70,
                    decoration: BoxDecoration(
                      // color: Colors.blue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        // SizedBox(width: 300,),
                        // SizedBox(height: 20,),
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
                          fPrototypeTextAndInput(
                            content: "Ingrese su nombre",
                            thisTitle: "Nombre",
                            onChanged: (value){
                              print(value);
                            },
                            thisAutocorrect: true,
                            thisObscureText: false,
                            thisEnableSuggestions: true,
                          ),
                          fPrototypeTextAndInput(
                            content: "Ingrese su apellido",
                            thisTitle: "Apellido",
                            onChanged: (value){
                              print(value);
                            },
                            thisAutocorrect: true,
                            thisObscureText: false,
                            thisEnableSuggestions: true,
                          ),
                          fPrototypeTextAndInput(
                            content: "Ingrese su direccion",
                            thisTitle: "Direccion",
                            thisIcon: Icon(Icons.location_on_outlined,size: 27,),
                            onChanged: (value){
                              print(value);
                            },
                            thisAutocorrect: true,
                            thisObscureText: false,
                            thisEnableSuggestions: true,
                          ),
                          fPrototypeTextAndInput(
                            content: "Ingrese su telefono",
                            thisTitle: "Telefono",
                            thisIcon: Icon(Icons.phone_android_outlined,size: 27,),
                            onChanged: (value){
                              print(value);
                            },
                            thisAutocorrect: true,
                            thisObscureText: false,
                            thisEnableSuggestions: true,
                          ),
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
                          ),
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