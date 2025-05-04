import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/add_or_remove_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamPoints extends StatelessWidget {
  const TeamPoints({super.key, required this.teamName, required this.points});
  final String teamName;
  final num points;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              teamName,
              style: teamName == 'الفريق الاول' ? Styles.bold16 : Styles.bold15,
            ),
            const SizedBox(height: 10),
            Container(
              constraints: BoxConstraints(minWidth: 55.w, minHeight: 25.h),
              decoration: BoxDecoration(
                color: const Color(0x8817303D),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Text('$points', style: Styles.bold16)),
            ),
          ],
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return AddOrRemovePoints(
                teamId: teamName == 'الفريق الاول' ? 1 : 2,
                value: (pow(2, num.parse(index.toString())) * 5),
              );
            },
          ),
        ),
      ],
    );
  }
}
