import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:iconsax/iconsax.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> items;
  final String hint;
  final ValueChanged<String?>? onChanged;
  final String? selectedValue;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final Color borderColor;
  final bool fontWeight;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.hint,
    this.onChanged,
    this.selectedValue,
    this.iconColor = Colors.grey,
    this.backgroundColor = Colors.blueGrey,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
    this.fontWeight = true,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(AppPadding.p8),
        border: Border.all(color: widget.borderColor, width: 1.5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.hint,
                style: TextStyle(
                  color: widget.textColor,
                  fontWeight:
                      widget.fontWeight ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              Icon(Iconsax.arrow_bottom, color: widget.iconColor),
            ],
          ),
          icon: const SizedBox(),
          dropdownColor: widget.backgroundColor,
          style: TextStyle(color: widget.textColor),
          isExpanded: true,
          borderRadius: BorderRadius.circular(AppPadding.p8),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: widget.textColor),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
