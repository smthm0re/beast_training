import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoImageWidget extends StatelessWidget {
  final Color color;
  final double imageWidth;
  final double imageHeight;

  const LogoImageWidget({
    super.key,
    required this.color,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color,
      child: SvgPicture.asset(
        'lib/ui-kit/assets/svg/beast_logo.svg',
        width: imageWidth,
        height: imageHeight,
      ),
    );
  }
}
