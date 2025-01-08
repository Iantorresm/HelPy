
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpy/main.dart';

class ContainerSesion extends StatefulWidget {
  final bool mostrarSesion;
  final VoidCallback onDismissed;

  const ContainerSesion({super.key, required this.mostrarSesion, required this.onDismissed});

  @override
  State<ContainerSesion> createState() => _ContainerSesionState();
}

class _ContainerSesionState extends State<ContainerSesion> {
  bool usercheck = true;
  bool providercheck = false;
  
  void _toggleIcon() {
    setState(() {
      usercheck = !usercheck;
      providercheck = !providercheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: widget.mostrarSesion,
          child: Dismissible(
            onDismissed: (direction) {
              widget.onDismissed();
            },
            key: const ValueKey('containerSesion'),
            direction: DismissDirection.vertical,
            child: Container(
              width: 400,
              height: 560,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Container(
                  width: 400-70,
                  height: 570-70,
                  decoration: BoxDecoration(
                    // color: Colors.purpleAccent
                  ),
                  child: Column(
                    children: [
                      // Column(
                        // children: [
                          Container(
                            width: 60,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(209, 209, 209, 1),
                            ), 
                          ),
                      //   ],
                      // ),
                      SizedBox(width: 300,),
                      // SizedBox(height: 300,),
                      // Column(
                      //   children: [
                      //     IconButton(
                      //       onPressed: (){},
                      //       icon: Icon(Icons.close))
                      //   ],
                      // ),
                          // SizedBox(width: 150,),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(
                            "Inicia Sesion",
                            style: GoogleFonts.imprima(
                              color: Colors.black,
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: (){
                                // Stack(
                                //   children: [
                                //     ContainerRegister(
                                //       mostrarRegister: mostrarRegister,
                                //       onDismissed: (){
                                //         setState(() {
                                //           mostrarRegister = false;
                                //         });
                                //       },
                                //     ),
                                //   ],
                                // );
                                setState(() {
                                  mostrarRegister = true;
                                  widget.onDismissed();
                                });
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.transparent),
                              padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
                              splashFactory: NoSplash.splashFactory,
                              overlayColor: WidgetStateProperty.all(Colors.transparent),
                              textStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
                                if (states.contains(WidgetState.pressed)) {
                                  return TextStyle(fontWeight: FontWeight.bold);
                                }
                                return TextStyle(fontWeight: FontWeight.normal);
                              }),
                            ),
                            child: Text(
                              "O crea una cuenta",
                              style: GoogleFonts.imprima(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 27,),
                      Row(
                        children: [
                          Text(
                            "Correo electronico",
                            style: GoogleFonts.imprima(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13,),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: 'Ingrese su correo electronico',
                          hintStyle: GoogleFonts.imprima(),
                          fillColor: Colors.black,
                        ),
                        onSubmitted: (value){
                          print(value);
                        },
                      ),
                      
                      SizedBox(height: 13,),
                      Row(
                        children: [
                          Text(
                            "Contraseña",
                            style: GoogleFonts.imprima(
                              color: Colors.black,
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13,),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: 'Ingrese su contraseña',
                          hintStyle: GoogleFonts.imprima(),
                          fillColor: Colors.black,
                          
                        ),
                        enableSuggestions: false,
                        obscureText: true,
                        autocorrect: false,
                        onChanged: (value){
                          print(value);
                        },
                      ),
                        // SvgPicture.asset('iconos/user.svg'),
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          SizedBox(width: 35,),
                          IconButton(
                            onPressed: _toggleIcon,
                            icon: 
                            providercheck == false 
                                ? SvgPicture.asset(
                                    'assets/svgs/usercheck.svg',
                                    width: 70,
                                    height: 70,
                                  )
                                : SvgPicture.asset(
                                    'assets/svgs/user.svg',
                                    width: 70,
                                    height: 70,
                                  )
                          ),
                          SizedBox(width: 100,),
                          IconButton(
                            onPressed: _toggleIcon,
                            icon: 
                            usercheck == false 
                                ? SvgPicture.asset(
                                    'assets/svgs/providercheck.svg',
                                    width: 70,
                                    height: 70,
                                  )
                                : SvgPicture.asset(
                                    'assets/svgs/provider.svg',
                                    width: 70,
                                    height: 70,
                                  )
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextButton(
                            onPressed: (){},
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
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}