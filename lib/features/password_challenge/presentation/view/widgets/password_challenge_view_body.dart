import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_app_bar.dart';

import 'password_challenge_grid_view_builder.dart';

class PasswordChallengeViewBody extends StatelessWidget {
  const PasswordChallengeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppBar(title: 'كلمة السر', context: context),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PasswordChallengeGridViewBuilder(),
          ),
        ),
      ],
    );
  }
}
