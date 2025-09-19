import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final double borderRadius;
  final Color? fillColor;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.borderRadius = 12,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fillColor ?? AppColors.grey.shade200,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: DropdownButtonFormField<T>(
        padding: EdgeInsets.symmetric(vertical: 8),
        initialValue: value,
        items: items,
        onChanged: onChanged,
        isExpanded: true,
        decoration: const InputDecoration(border: InputBorder.none),
        hint: Text(
          hintText,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
        icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primary),
      ),
    );
  }
}
