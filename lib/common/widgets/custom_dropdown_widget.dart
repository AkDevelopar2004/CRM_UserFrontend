import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    this.validator,
    this.backgroundColor,
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
    this.contentPadding,
    this.prefixIcon,
    this.isPassword = false,
  });

  final String? Function(String?)? validator;
  final Color? backgroundColor;
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
  final Widget? prefixIcon;
  final bool isPassword;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: widget.enabled ?? true,
        obscureText: widget.isPassword ? _obscureText : false,
        style: TextStyle(
          fontSize: widget.fontSize ?? 16,
          fontWeight: widget.fontWeight,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0),
          hintText: widget.hintText ?? "",
          hintStyle: TextStyle(
            fontSize: widget.fontSize ?? 16,
            fontWeight: widget.fontWeight,
            color: widget.hintTextColor ?? Colors.grey,
            fontFamily: 'Poppins',
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          fillColor: widget.backgroundColor,
          prefixIcon: widget.prefixIcon,
          prefixText: widget.prefixText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
