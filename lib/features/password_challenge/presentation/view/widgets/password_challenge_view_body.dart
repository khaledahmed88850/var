import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/view/widgets/password_challenge_player_card.dart';

class PasswordChallengeViewBody extends StatelessWidget {
  const PasswordChallengeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppBar(
          title: 'كلمة السر',
          onPressed: () {
            Navigator.pop(context);
          },
          context: context,
        ),
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

class PasswordChallengeGridViewBuilder extends StatelessWidget {
  const PasswordChallengeGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.15,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return PasswordChallengePlayerCard(index: (index + 1).toString());
      },
    );
  }
}
