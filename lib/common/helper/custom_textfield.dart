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
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool autoFocus;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool showBorder;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final VoidCallback? onSuffixTap;
  final bool isLocation;
  final void Function()? onLocationTap;
  final bool isNumber;
  final int? maxLines;
  final Iterable<String>? autofillHints;
  final Widget? hint;

  const CustomTextField({
    super.key,
    this.labelText,
    this.isPassword = false,
    this.isEnabled = true,
    this.controller,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.focusNode,
    this.nextFocus,
    this.autoFocus = false,
    this.onSubmit,
    this.onChanged,
    this.validator,
    this.showBorder = true,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.isLocation = false,
    this.onLocationTap,
    this.suffixWidget,
    this.isNumber = false,
    this.maxLines = 1,
    this.autofillHints,
    this.hint,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        autofillHints: widget.autofillHints,
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: widget.isPassword ? _obscure : false,
        textInputAction: widget.inputAction,
        enabled: widget.isEnabled,
        autofocus: widget.autoFocus,

        inputFormatters: widget.isNumber
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        onFieldSubmitted: (value) {
          if (widget.nextFocus != null) {
            FocusScope.of(context).requestFocus(widget.nextFocus);
          }
          if (widget.onSubmit != null) {
            widget.onSubmit!(value);
          }
        },
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          fillColor: AppColors.grey.shade200,
          isDense: true,
          hint: widget.hint,
          label: RichText(
            text: TextSpan(
              text: widget.labelText ?? '',
              style: TextStyle(
                color: AppColors.grey,
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
              : widget.isLocation
              ? InkWell(
                  onTap: widget.onLocationTap,
                  child: Icon(Icons.location_on_outlined, size: 20),
                )
              : widget.suffixIcon != null
              ? IconButton(
                  icon: Icon(widget.suffixIcon, size: 20),
                  onPressed: widget.onSuffixTap,
                )
              : widget.suffixWidget,
        ),
      ),
    );
  }
}
