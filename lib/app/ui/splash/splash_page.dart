import 'package:flutter/material.dart';
import 'package:helpy/app/ui/home/home_page.dart';
import 'package:helpy/constants/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blueColor,
      body: GestureDetector(
        //para navegar a otra ventana al detectar un toque
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return HomePage(
              title: 'home',
            ); //página a la que se navega desde splash, debe ser home
          }));
        },
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo/helpy_logo.png'),
                /*Text(
                  'HelPY',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
