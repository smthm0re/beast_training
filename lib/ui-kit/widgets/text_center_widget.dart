import 'package:flutter/material.dart';

class TextCenterWidget extends StatelessWidget {
  final Color color;
  final String text;

  const TextCenterWidget({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: color,
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
