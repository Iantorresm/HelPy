

import 'package:flutter/material.dart';
import 'package:helpy/app/ui/splash/splash_page.dart';
import 'package:helpy/constants/colors.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //paleta de colores
    const primary = AppColor.blueColor;
    const secondary = Color(0xFFF4C430);
    const textColor = Color(0xFF333333);
    const background = Color(0xFFFFFFFF);

    return MaterialApp(
      title: 'HelPY',
      debugShowCheckedModeBanner: false,//para que desaparezca el banner rojo 'debug' de la esquina
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          secondary: secondary,
          surface: background,
          ),
        scaffoldBackgroundColor: background,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Imprima',
          bodyColor: textColor,
          displayColor: textColor
        ),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}