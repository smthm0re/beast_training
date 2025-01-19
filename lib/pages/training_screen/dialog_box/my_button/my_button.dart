import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color.fromARGB(255, 95, 156, 98),
      child: Text(text),
    );
  }
}
