import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/widgets/custom_app_bar.dart';

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
          const SliverToBoxAdapter(
            child: Column(
              children: [
                ChallengeCard(
                  image: Assets.assetsImagesPassword,
                  numOfPlayers: '2 - 4',
                  title: 'كلمة السر',
                ),
                SizedBox(height: 12),
                ChallengeCard(
                  image: Assets.assetsImagesRisk,
                  numOfPlayers: '2 - 4',
                  title: 'ريسك',
                ),
                SizedBox(height: 12),

                ChallengeCard(
                  image: Assets.assetsImagesWhoami,
                  numOfPlayers: '1 - 4',
                  title: 'من انا',
                ),
                SizedBox(height: 12),

                ChallengeCard(
                  image: Assets.assetsImagesBank,
                  numOfPlayers: '2 - 4',
                  title: 'البنك',
                ),

                SizedBox(height: 12),

                ChallengeCard(
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
