import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/bank_challenge_view.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/view/password_challenge_view.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/risk_challenge_view.dart';

import 'challenge_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: buildAppBar(
              context: context,
              title: 'التحديات',
              arrowBackExist: false,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ChallengeCard(
                  image: Assets.assetsImagesPassword,
                  numOfPlayers: '2 - 4',
                  title: 'كلمة السر',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PasswordChallengeView.routeName,
                    );
                  },
                ),
                const SizedBox(height: 12),
                ChallengeCard(
                  image: Assets.assetsImagesRisk,
                  numOfPlayers: '2 - 4',
                  title: 'ريسك',
                  onPressed: () {
                    Navigator.pushNamed(context, RiskChallengeView.routeName);
                  },
                ),
                const SizedBox(height: 12),

                const ChallengeCard(
                  image: Assets.assetsImagesWhoami,
                  numOfPlayers: '1 - 4',
                  title: 'من انا',
                ),
                const SizedBox(height: 12),

                ChallengeCard(
                  image: Assets.assetsImagesBank,
                  numOfPlayers: '2 - 4',
                  title: 'البنك',
                  onPressed: () {
                    Navigator.pushNamed(context, BankChallengeView.routeName);
                  },
                ),

                const SizedBox(height: 12),

                const ChallengeCard(
                  image: Assets.assetsImagesTimer,
                  numOfPlayers: '1 - 4',
                  title: '5 في 10',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
