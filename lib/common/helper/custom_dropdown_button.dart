import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class CommonDropdownButton<T> extends StatelessWidget {
  final String label;
  final List<T> items;
  final T? value;
  final String Function(T) getLabel;
  final dynamic Function(T) getValue;
  final void Function(dynamic)? onChanged;
  final TextEditingController? controller;
  final bool saveLabelInController;

  const CommonDropdownButton({
    super.key,
    required this.label,
    required this.items,
    required this.getLabel,
    required this.getValue,
    this.value,
    this.onChanged,
    this.controller,
    this.saveLabelInController = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      initialValue: value != null ? getValue(value as T) : null,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      items: items.map((item) {
        return DropdownMenuItem<dynamic>(
          value: getValue(item),
          child: Text(
            getLabel(item),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: AppColors.textColor, fontSize: 14),
          ),
        );
      }).toList(),
      onChanged: (val) {
        if (controller != null && val != null) {
          final selectedItem = items.firstWhere(
            (item) => getValue(item) == val,
          );
          controller!.text = saveLabelInController
              ? getLabel(selectedItem)
              : getValue(selectedItem).toString();
        }
        if (onChanged != null) onChanged!(val);
      },
    );
  }
}
