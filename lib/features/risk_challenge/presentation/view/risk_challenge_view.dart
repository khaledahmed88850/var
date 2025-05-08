import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/risk_challenge_view_body.dart';

class RiskChallengeView extends StatelessWidget {
  const RiskChallengeView({super.key});
  static const String routeName = '/RiskChallengeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'ريسك',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const RiskChallengeViewBody(),
    );
  }
}
