import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    super.key,
    required this.title,
    required this.image,
    required this.numOfPlayers,
    this.onPressed,
  });
  final String title;
  final String image;
  final String numOfPlayers;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent.withValues(alpha: 0.4),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.transparent.withValues(alpha: 0.4),
      ),
      height: 160.h,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Styles.bold23),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.person),
                    Text(numOfPlayers, style: Styles.bold13),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.brightTeal,
                  ),
                  child: Text(
                    'ابدأ التحدي',
                    style: Styles.bold13.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(image, fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
