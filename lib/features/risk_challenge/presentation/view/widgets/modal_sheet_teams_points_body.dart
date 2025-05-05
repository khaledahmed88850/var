import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/risk_points_calculator_cubit/risk_point_calculator_cubit.dart';
import 'team_points.dart';

class ModalSheetTeamsPointsBody extends StatelessWidget {
  const ModalSheetTeamsPointsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TeamPoints(
            teamName: 'الفريق الاول',
            points: context.read<RiskPointCalculatorCubit>().firstTeamPoints,
          ),
          const Divider(color: Colors.grey, thickness: 2, height: 20),
          TeamPoints(
            teamName: 'الفريق الثاني',
            points: context.watch<RiskPointCalculatorCubit>().secondTeamPoints,
          ),
          const SizedBox(height: 16),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              backgroundColor: Colors.grey.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => context.read<RiskPointCalculatorCubit>().reset(),
            child: Text(
              'اعادة',
              style: Styles.bold16.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
