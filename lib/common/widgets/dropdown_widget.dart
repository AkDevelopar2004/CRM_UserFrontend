import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final ValueChanged<String> onChanged;

  const CustomDropdownWidget({
    Key? key,
    required this.items,
    required this.hintText,
    required this.onChanged, required Color color,
  }) : super(key: key);

  @override
  _CustomDropdownWidgetState createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedItem,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            ),
          ),
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedItem = value!;
            });
            widget.onChanged(value!);
          },
        ),
      ),
    );
  }
}
