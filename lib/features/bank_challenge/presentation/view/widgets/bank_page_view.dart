import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/bank_challenge_cubit/bank_challenge_cubit.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/widgets/bank_page_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bank_question_increment_cubit/bank_question_increment_cubit.dart';

class BankPageView extends StatelessWidget {
  const BankPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        context.read<BankQuestionIncrementCubit>().reset();
        context.read<BankChallengeCubit>().emitBankChallengeStates();
      },
      physics: const NeverScrollableScrollPhysics(),
      reverse: true,
      controller: pageController,
      children: List.generate(6, (index) => BankPageViewItem(index: index + 1)),
    );
  }
}
