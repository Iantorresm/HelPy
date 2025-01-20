import 'package:flutter/material.dart';
import 'package:helpy/app/ui/home/home_page.dart';
import 'package:helpy/constants/colors.dart';

class ProviderHomePage extends StatefulWidget {
  const ProviderHomePage({super.key});

  @override
  State<ProviderHomePage> createState() => _ProviderHomePageState();
}

class _ProviderHomePageState extends State<ProviderHomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blueColor,
        leading: IconButton(
          icon: Image.asset(
              'assets/images/iconos_barra_superior/arrow_back_white.png'),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Implementa la funcionalidad "hacia atrás"
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomePage(
                        title: 'Página principal',
                      );
                    }));
                  },
                  icon: Image.asset(
                    'assets/images/logo/helpy_logo.png',
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print('Calendario');
                  },
                  icon: Image.asset(
                    'assets/images/iconos_barra_superior/Calendar.png',
                    width: MediaQuery.of(context).size.height * 0.05,
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print('Notificación');
                  },
                  icon: Image.asset(
                    'assets/images/iconos_barra_superior/Notification.png',
                    width: MediaQuery.of(context).size.height * 0.05,
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print('Logout');
                  },
                  icon: Image.asset(
                    'assets/images/iconos_barra_superior/Logout.png',
                    width: MediaQuery.of(context).size.height * 0.05,
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(child: Text('El botón se ha pulsado $count veces')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++; //actualizando el valor de la variable de estado
          setState(
              () {}); //se llama luego de actualizar las variables que afectan el estado del widget
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
