import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/cubit/risk_challenge_cubit.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/risk_challenge_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RiskChallengeListView extends StatelessWidget {
  const RiskChallengeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RiskChallengeCubit, RiskChallengeState>(
      builder: (context, state) {
        if (state is RiskChallengeSuccess) {
          return ListView.builder(
            itemCount: state.riskChallengeModelList.length,
            itemBuilder: (context, index) {
              return RiskChallengeCategory(
                riskChallengeModel: state.riskChallengeModelList[index],
              );
            },
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
