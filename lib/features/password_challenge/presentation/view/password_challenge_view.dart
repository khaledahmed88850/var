import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/view/widgets/password_challenge_view_body.dart';

class PasswordChallengeView extends StatelessWidget {
  const PasswordChallengeView({super.key});
  static const String routeName = '/PasswordChallengeView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PasswordChallengeViewBody());
  }
}
