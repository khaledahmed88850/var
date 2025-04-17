import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.textColor = Colors.black87,
  });
  final String text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(80.w, 40.h),
        backgroundColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      onPressed: () {},
      child: Text(text, style: Styles.bold16.copyWith(color: textColor)),
    );
  }
}
