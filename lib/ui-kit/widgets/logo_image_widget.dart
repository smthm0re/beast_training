import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoImageWidget extends StatelessWidget {
  final Color colorBackground;
  final double imageSize;

  const LogoImageWidget({
    super.key,
    required this.colorBackground,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: colorBackground,
      child: SvgPicture.asset(
        'lib/ui-kit/assets/svg/beast_logo.svg',
        width: imageSize,
        height: imageSize,
      ),
    );
  }
}
