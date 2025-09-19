import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final List<String> options;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const CustomRadioButton({
    super.key,
    required this.options,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return RadioGroup<String>(
      groupValue: selectedValue,
      onChanged: (value) {
        if (value != null) {
          setState(() => selectedValue = value);
          widget.onChanged?.call(value);
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.options.map((option) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<String>(value: option, activeColor: AppColors.primary),
              Text(option),
            ],
          );
        }).toList(),
      ),
    );
  }
}
