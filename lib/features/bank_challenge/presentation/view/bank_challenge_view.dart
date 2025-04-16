import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/widgets/bank_challenge_view_body.dart';

class BankChallengeView extends StatelessWidget {
  const BankChallengeView({super.key});
  static const String routeName = '/bankChallenge';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('بنك', style: Styles.bold28),
        centerTitle: true,
      ),
      body: const BankChallengeViewBody(),
    );
  }
}
