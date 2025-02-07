import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoImageWidget extends StatelessWidget {
  final Color color;
  final double imageSize;

  const LogoImageWidget({
    super.key,
    required this.color,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color,
      child: SvgPicture.asset(
        'lib/ui-kit/assets/svg/beast_logo.svg',
        width: imageSize,
        height: imageSize,
      ),
    );
  }
}
