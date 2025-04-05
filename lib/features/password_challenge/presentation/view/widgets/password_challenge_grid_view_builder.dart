import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/cubit/password_challenge_cubit.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/view/widgets/password_challenge_player_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordChallengeGridViewBuilder extends StatelessWidget {
  const PasswordChallengeGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordChallengeCubit, PasswordChallengeState>(
      builder: (context, state) {
        if (state is PasswordChallengeSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.15,
            ),
            itemCount: state.passwordChallengeModelList.length,
            itemBuilder: (context, index) {
              return PasswordChallengePlayerCard(
                passwordChallengeModel: state.passwordChallengeModelList[index],
                index: (index + 1).toString(),
              );
            },
          );
        } else if (state is PasswordChallengeFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
