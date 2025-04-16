import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/risk_challenge_list_view.dart';

class RiskChallengeViewBody extends StatelessWidget {
  const RiskChallengeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: RiskChallengeListView(),
    );
  }
}
