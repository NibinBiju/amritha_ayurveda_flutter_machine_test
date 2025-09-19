import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final bool isPassword;
  final bool isEnabled;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool showBorder;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final bool isNumber;
  final int? maxLines;
  final Iterable<String>? autofillHints;
  final Widget? hint;
  final bool isDate; // <-- NEW for date picker
  final DateTime? firstDate;
  final DateTime? lastDate;

  const CustomTextField({
    super.key,
    this.labelText,
    this.isPassword = false,
    this.isEnabled = true,
    this.controller,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.onSubmit,
    this.onChanged,
    this.validator,
    this.showBorder = true,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixWidget,
    this.isNumber = false,
    this.maxLines = 1,
    this.autofillHints,
    this.hint,
    this.isDate = false, // default false
    this.firstDate,
    this.lastDate,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  Future<void> _pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
    );

    if (pickedDate != null) {
      widget.controller?.text =
          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      if (widget.onChanged != null) {
        widget.onChanged!(widget.controller!.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autofillHints: widget.autofillHints,
        maxLines: widget.maxLines,
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscure : false,
        textInputAction: widget.inputAction,
        enabled: widget.isEnabled,
        readOnly: widget.isDate, // make readOnly for date
        inputFormatters: widget.isNumber
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        onTap: widget.isDate
            ? () => _pickDate(context)
            : null, // open date picker if date field
        onFieldSubmitted: (value) {
          if (widget.onSubmit != null) {
            widget.onSubmit!(value);
          }
        },
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: AppColors.textColor, fontSize: 16),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          fillColor: AppColors.grey.shade200,
          isDense: true,
          hint: widget.hint,
          label: RichText(
            text: TextSpan(
              text: widget.labelText ?? '',
              style: TextStyle(
                color: const Color.fromARGB(255, 73, 73, 73),
                fontSize: 18,
                fontFamily: 'Poppins',
                height: 60,
              ),
            ),
          ),
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, size: 20)
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                )
              : widget.isDate
                  ? Icon(Icons.calendar_today, size: 20) // calendar icon
                  : widget.suffixWidget,
        ),
      ),
    );
  }
}
