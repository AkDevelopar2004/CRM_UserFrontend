import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize,
      this.color,
      this.textAlign,
      this.fontWeight,
      this.letterSpacing,
      this.textOverflow,
      this.textDecoration,
      this.height,
      this.maxLines,
      this.shadows});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Color? color;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;
  final double? height;
  final int? maxLines;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
          height: height,
          decoration: textDecoration,
          fontSize: fontSize ?? 12,
          fontWeight: fontWeight,
          color: color,
          fontFamily: 'Poppins',
          letterSpacing: letterSpacing,
          shadows: shadows),
    );
  }
}
