import 'package:flutter/material.dart';

class Title1 extends StatelessWidget {
  const Title1(
    this.text, {
    super.key,
    this.color,
  });

  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
    );
  }
}
