import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  final String svgPath;
  final double size;
  final Color? color;
  final VoidCallback onTap;

  const IconWidget({
    Key? key,
    required this.svgPath,
    this.size = 24.0,
    this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        svgPath,
        height: size,
        width: size,
        color: color,
      ),
    );
  }
}
