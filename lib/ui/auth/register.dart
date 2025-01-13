import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'package:helpy/ui/auth/loginExtend.dart';

class ContainerRegister extends StatefulWidget {
  final VoidCallback onDismissed;

  const ContainerRegister({super.key, required this.onDismissed});

  @override
  State<ContainerRegister> createState() => _ContainerSesionState();
}

class _ContainerSesionState extends State<ContainerRegister> {
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
              key: const ValueKey('containerRegister'),
              direction: DismissDirection.vertical,
              child: Container(
                width: 400,
                height: 560,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: SizedBox(
                    width: 400-70,
                    height: 570-70,
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

                        // Por que hay dos SizedBox? No se, funciona
                        // Por que no sumo el valor de los sizedbox? No se, funciona
                        SizedBox(width: 300,),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Wrap(
                              children: [
                                // Icon(Icons.person_outline_rounded,size: 27,),
                                Text(
                                  "Crea tu perfil",
                                  style: GoogleFonts.imprima(
                                    color: Colors.black,
                                    fontSize: 20
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 27,),
                        Row(
                          children: [
                            Wrap(
                              children: [
                                Icon(Icons.email_outlined,size: 27,),
                                Text(
                                  " Correo electronico",
                                  style: GoogleFonts.imprima(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
                            // print(value);
                          },
                        ),
                        
                        SizedBox(height: 13,),
                        Row(
                          children: [
                            Wrap(
                              children: [
                                Icon(Icons.lock_outline_rounded,size: 27,),
                                Text(
                                  " Contraseña",
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
                        ),
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
                            TextButton.icon(
                              onPressed: (){
                                widget.onDismissed();
                                setState(() {
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: ContainerSesionExtend(
                                      onDismissed: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
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
                              icon: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                              label: Text(
                                'Continuar',
                                style: GoogleFonts.imprima(
                                  color: Colors.black,
                                  fontSize: 20,
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
          ],
        ),
      ),
    );
  }
}