import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown(
      {super.key,
      this.width,
      this.height,
      this.selectedValue,
      required this.items,
      this.onChanged,
      this.flex = 1});
  final double? height;
  final double? width;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
           contentPadding: const EdgeInsets.symmetric(
            vertical: 2.0, // Adjust this value for desired height
            horizontal: 12.0,
          ),
        ),
        dropdownColor: Colors.white,
        iconEnabledColor: Colors.black, // Dropdown icon color
        style: const TextStyle(color: Colors.black), // Selected text color
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                color: AppColors.darkColor, // Ensure contrast
                // Removed backgroundColor for better clarity
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
