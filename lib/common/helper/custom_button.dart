import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:amritha_ayurveda/core/configs/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.margin,
    this.width,
    this.height,
  });

  final String title;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: EdgeInsets.all(14),
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.black12, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary,
        ),
        child: Center(child: Text(title, style: AppTextStyles.buttonTextStyle)),
      ),
    );
  }
}

