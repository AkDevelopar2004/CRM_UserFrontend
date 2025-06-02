import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget(
      {super.key,
      this.validator,
      this.backgroundColor,
      this.suffixIcon,
      this.prefixIcon,
      this.controller,
      this.hintText,
      this.fontSize,
      this.fontWeight,
      this.hintTextColor,
      this.rounded,
      this.enabled,
      this.prefixText,
      this.height,
      this.width,
      this.contentPadding});

  final String? Function(String?)? validator;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? hintText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? hintTextColor;
  final double? rounded;
  final bool? enabled;
  final String? prefixText;
  final double? height;
  final double? width;
  final double? contentPadding;
  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.rounded ?? 0),
      ),
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.rounded ?? 0),
          ),
          fillColor: widget.backgroundColor,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          prefixText: widget.prefixText,
          hintText: widget.hintText,
          enabled: widget.enabled ?? true,
          hintStyle: TextStyle(
            fontSize: widget.fontSize ?? 18,
            fontWeight: widget.fontWeight,
            color: widget.hintTextColor,
            fontFamily: 'Poppins',
          ),
        ),
     ),
);
}
}