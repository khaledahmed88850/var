import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/cubits/risk_challenge_cubit/risk_challenge_cubit.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/modal_sheet_teams_points.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/risk_challenge_category.dart';
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
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.grey.shade400,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                  ),
                  onPressed:
                      () => showModalBottomSheet(
                        constraints: BoxConstraints(maxHeight: 0.4.sh),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => const ModalSheetTeamsPoints(),
                      ),
                  child: Text(
                    'عرض النقاط',
                    style: Styles.bold19.copyWith(color: Colors.black),
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
