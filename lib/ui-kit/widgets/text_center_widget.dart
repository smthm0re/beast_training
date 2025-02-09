import 'package:flutter/material.dart';

class TextCenterWidget extends StatelessWidget {
  final Color colorBackground;
  final String text;

  const TextCenterWidget({
    super.key,
    required this.colorBackground,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: colorBackground,
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
