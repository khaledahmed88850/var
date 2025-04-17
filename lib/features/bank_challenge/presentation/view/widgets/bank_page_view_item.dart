import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/custom_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankPageViewItem extends StatelessWidget {
  const BankPageViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text('السؤال 1', style: Styles.semiBold16),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 150.h),

            decoration: BoxDecoration(
              color: AppColors.darkGreenBlue,

              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'من هو هداف نادي ريال مدريد التاريخي',
                style: Styles.bold16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('الاجابة', style: Styles.semiBold16),
          Container(
            constraints: BoxConstraints(minHeight: 60.h, maxWidth: 250.w),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.darkGreengrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text('كريستيانو رونالدو', style: Styles.bold16),
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                textDirection: TextDirection.ltr,
                children: [
                  Text(' :Counter', style: Styles.semiBold16),
                  Text('2', style: Styles.bold16),
                ],
              ),
              CustomTextButton(text: 'Bank'),
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButton(
                text: 'إجابة صحيحة',
                textColor: Color(0xFF19811D),
              ),
              CustomTextButton(text: 'إجابة خاطئة', textColor: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
