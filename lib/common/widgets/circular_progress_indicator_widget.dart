import 'package:flutter/material.dart';

class CircularProgressIndidatorWidget  extends StatefulWidget {
  final double? size;
  final Color? color;
  const CircularProgressIndidatorWidget ({super.key, this.size, this.color});

  @override
  State<CircularProgressIndidatorWidget > createState() =>
      _CircularProgressIndidatorState();
}

class _CircularProgressIndidatorState
    extends State<CircularProgressIndidatorWidget > {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child:  CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: widget.color,
        valueColor: const AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),
    );
  }
}
