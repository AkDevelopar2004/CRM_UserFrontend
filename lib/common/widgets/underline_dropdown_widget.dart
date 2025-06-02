import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';

class UnderlineDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String selectedItem;
  final Function(String?) onChanged;

  const UnderlineDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: label,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.semiDarkColor,
        ),
        DropdownButtonFormField<String>(
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          value: selectedItem,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(top: 8),
            border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 223, 219, 219)),
            ),
          ),
        ),
      ],
    );
  }
}
