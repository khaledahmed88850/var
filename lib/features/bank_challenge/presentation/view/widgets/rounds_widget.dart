import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class RoundsWidget extends StatelessWidget {
  const RoundsWidget({super.key, required this.index, this.selectedIndex = 0});
  final int index;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      curve: Curves.elasticIn,
      margin: const EdgeInsets.all(8),
      constraints: BoxConstraints(minWidth: 80.w),
      decoration: BoxDecoration(
        color: index == selectedIndex ? AppColors.seaGreen : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text('الجولة ${index + 1}', style: Styles.bold16)),
    );
  }
}
