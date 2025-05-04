import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/cubits/risk_challenge_cubit/risk_challenge_cubit.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/cubits/risk_ponts_calculator_cubit/risk_point_calculator_cubit.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/risk_challenge_category.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/team_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RiskChallengeListView extends StatelessWidget {
  const RiskChallengeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RiskChallengeCubit, RiskChallengeState>(
      builder: (context, state) {
        if (state is RiskChallengeSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      TeamPoints(
                        teamName: 'الفريق الاول',
                        points:
                            context
                                .watch<RiskPointCalculatorCubit>()
                                .firstTeamPoints,
                      ),
                      TeamPoints(
                        teamName: 'الفريق الثاني',
                        points:
                            context
                                .watch<RiskPointCalculatorCubit>()
                                .secondTeamPoints,
                      ),
                    ],
                  ),
                ),

                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.riskChallengeModelList.length,
                  itemBuilder: (context, index) {
                    return RiskChallengeCategory(
                      riskChallengeModel: state.riskChallengeModelList[index],
                    );
                  },
                ),
              ],
            ),
          );
        } else if (state is RiskChallengeFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
