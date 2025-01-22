import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'package:helpy/ui/auth/moreRegisterWide.dart';
import 'package:helpy/ui/auth/moreRegisterNormal.dart';
class ContainerRegisterWide extends StatefulWidget {
  final VoidCallback onDismissed;

  const ContainerRegisterWide({super.key, required this.onDismissed});

  @override
  State<ContainerRegisterWide> createState() => _ContainerRegisterWideState();
}

class _ContainerRegisterWideState extends State<ContainerRegisterWide> {
  bool _usercheck = true;
  bool _providercheck = false;
  
  void _toggleIcon() {
    setState(() {
      _usercheck = !_usercheck;
      _providercheck = !_providercheck;
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
                width: 600,
                height: 560,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: SizedBox(
                    width: 600-70,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 250,
                                  child:
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
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 250,
                                    child: TextField(
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
                                  ),
                                ],
                              ),
                              SizedBox(width: 27,),
                            Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: Wrap(
                                    children: [
                                      Icon(Icons.lock_outline_rounded,size: 27,),
                                      Text(
                                        " Repite tu contraseña",
                                        style: GoogleFonts.imprima(
                                          color: Colors.black,
                                          fontSize: 20
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: TextField(
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
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 13,),
                        // SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(width: 35,),
                            OutlinedButton.icon(
                              label: Text(""),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                                iconColor: Colors.white,
                                backgroundColor: _usercheck ? Color.fromRGBO(244, 196, 48, 0.7) : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10), // Esquina superior derecha redondeada
                                    bottomLeft: Radius.circular(10), // Esquina inferior derecha redondeada
                                  ),
                                  
                                ),
                              ),
                              onPressed: _toggleIcon,
                              icon: 
                              _providercheck == false 
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
                            // SizedBox(width: 100,),
                            OutlinedButton.icon(
                              label: Text(""),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                                iconColor: Colors.white,
                                backgroundColor: _providercheck ? Color.fromRGBO(244, 196, 48, 0.7) : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10), // Esquina superior derecha redondeada
                                    bottomRight: Radius.circular(10), // Esquina inferior derecha redondeada
                                  ),
                                  
                                ),
                              ),
                              onPressed: _toggleIcon,
                              icon: 
                              _usercheck == false 
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
                                    child: LayoutBuilder(
                                      builder: (BuildContext context, BoxConstraints constraints) {
                                        if(constraints.maxWidth >= 600){
                                          return MoreRegisterWide(
                                            onDismissed: (){
                                              Navigator.pop(context);
                                            },
                                          );
                                        }else{
                                          return MoreRegisterNormal(
                                            onDismissed: (){
                                              Navigator.pop(context);
                                            },
                                          );
                                        }
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