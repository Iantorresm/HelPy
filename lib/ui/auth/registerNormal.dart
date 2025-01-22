import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpy/ui/auth/moreRegisterNormal.dart';
import 'package:helpy/ui/auth/moreRegisterWide.dart';
import 'package:helpy/ui/auth/prototypeTextAndInput.dart';
import 'dart:ui';

class ContainerRegisterNormal extends StatefulWidget {
  final VoidCallback onDismissed;

  const ContainerRegisterNormal({super.key, required this.onDismissed});

  @override
  State<ContainerRegisterNormal> createState() => _ContainerRegisterNormalState();
}

class _ContainerRegisterNormalState extends State<ContainerRegisterNormal> {
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
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: SizedBox(
                    width: 400-70,
                    height: 600-70,
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

                        // Por que hay dos SizedBox? No se, funciona
                        // Por que no sumo el valor de los sizedbox? No se, funciona
                        // SizedBox(width: 300,),
                        // SizedBox(height: 20,),
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
                        fPrototypeTextAndInput(
                          content: "Ingrese su correo electronico",
                          thisTitle: "Correo electronico",
                          thisIcon: Icon(Icons.lock_outlined,size: 27,),
                          onChanged: (value){
                            print(value);
                          },
                          thisAutocorrect: false,
                          thisObscureText: true,
                          thisEnableSuggestions: false,
                        ),

                        fPrototypeTextAndInput(
                          content: "Ingrese su contraseña",
                          thisTitle: "Contraseña",
                          thisIcon: Icon(Icons.lock_outlined,size: 27,),
                          onChanged: (value){
                            print(value);
                          },
                          thisAutocorrect: false,
                          thisObscureText: true,
                          thisEnableSuggestions: false,
                        ),

                        fPrototypeTextAndInput(
                          content: "Ingrese su contraseña",
                          thisTitle: "Repita su contraseña",
                          thisIcon: Icon(Icons.lock_outlined,size: 27,),
                          onChanged: (value){
                            print(value);
                          },
                          thisAutocorrect: false,
                          thisObscureText: true,
                          thisEnableSuggestions: false,
                        ),
                        // SizedBox(width: 13,),
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
                        // SizedBox(height: 20,),
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