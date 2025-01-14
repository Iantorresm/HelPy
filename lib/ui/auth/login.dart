import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpy/ui/auth/registerNormal.dart';
import 'package:helpy/ui/auth/registerWide.dart';
import 'dart:ui';

class Login extends StatefulWidget {
  final VoidCallback onDismissed;

  const Login({super.key, required this.onDismissed});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _usercheck = true;
  bool _providercheck = false;
  String _password = '';
  String _errorText = '';
  bool _passvalid = false;
  bool _boolbutton = false;
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
                Navigator.pop(context);
              },
              key: const ValueKey('login'),
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
                      // color: Colors.red,
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
                        SizedBox(width: 300,),
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
                                widget.onDismissed();
                                setState(() {
                                  Navigator.pop(context);
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: LayoutBuilder(
                                    builder: (BuildContext context, BoxConstraints constraints) {
                                      if(constraints.maxWidth >= 600){
                                        // showDialog(
                                        //   context: context,
                                        //   builder: (BuildContext context) => BackdropFilter(
                                        //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                        //     child: ContainerRegister(
                                        //       onDismissed: (){
                                        //         Navigator.pop(context);
                                        //       },
                                        //     ),
                                        //   ),
                                        // );
                                        // return Scaffold(
                                        //   body: ContainerRegisterWide(onDismissed: (){
                                        //     Navigator.pop(context);
                                        //   }),
                                        // );
                                        return ContainerRegisterWide(onDismissed: (){
                                          Navigator.pop(context);
                                        },);
                                      }else{
                                        // return ContainerRegisterNormal(onDismissed: (){
                                        //     Navigator.pop(context);
                                        //   },),
                                        //   );
                                        // }
                                        return ContainerRegisterNormal(onDismissed: (){
                                          Navigator.pop(context);
                                        },);
                                      }
                                      },
                                    ),
                                  ),
                                );
                              },
                            
                              // Por alguna razon que desconozco, el boton
                              // no tiene bold al pulsar, sino al mantener pulsado
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
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
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
                          onChanged: (value){
                            print(value);
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
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            hintText: 'Ingrese su contraseña',
                            hintStyle: GoogleFonts.imprima(),
                            fillColor: Colors.black,
                            errorText: _errorText.isEmpty ? null : _errorText,
                          ),
                          enableSuggestions: false,
                          obscureText: true,
                          autocorrect: false,
                          onChanged: (value){
                            setState(() {
                              _password = value;
                              if(_password.length < 8){
                                _errorText = "La contraseña debe tener al menos 8 caracteres";
                              }else{
                                _errorText = "";
                              }
                              if(_boolbutton == true){
                                if(_passvalid == false){
                                  _errorText = "Contraseña incorrecta";
                                }
                              }
                            });
                          },
                          validator: (value){
                            if(_boolbutton == true){
                              if(_passvalid == false){
                                return "Contraseña incorrecta";
                              }
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            SizedBox(width: 35,),
                            IconButton(
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
                            SizedBox(width: 100,),
                            IconButton(
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
                            TextButton(
                              onPressed: (){
                                setState(() {
                                  _boolbutton = true;
                                  if(_password == "12345678"){
                                    _passvalid = true;
                                  }else{
                                    _passvalid = false;
                                  }
                                });
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