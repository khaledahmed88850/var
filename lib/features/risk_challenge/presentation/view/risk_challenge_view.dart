import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/risk_challenge_view_body.dart';

class RiskChallengeView extends StatelessWidget {
  const RiskChallengeView({super.key});
  static const String routeName = '/RiskChallengeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('ريسك', style: Styles.bold28),
        centerTitle: true,
      ),
      body: const RiskChallengeViewBody(),
    );
  }
}
