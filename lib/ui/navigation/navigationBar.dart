import 'package:flutter/material.dart';

AppBar NavBar(BuildContext context, VoidCallback onLoginPressed) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Helpy Logo
        SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image(
              image: AssetImage('assets/logo/image.png'),
            ),
          ),
        ),

        // Login button
        SizedBox(
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            onPressed: onLoginPressed,
            icon: Icon(
              Icons.login,
              size: 20,
            ),
            iconAlignment: IconAlignment.end,
            label: Text(
              "Iniciar sesión",
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ),
  );
}
