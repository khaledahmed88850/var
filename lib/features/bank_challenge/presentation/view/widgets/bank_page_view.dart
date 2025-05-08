import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/cubits/bank_timer_cubit/bank_timer_cubit.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/widgets/bank_page_view_bloc_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/bank_question_increment_cubit/bank_question_increment_cubit.dart';

class BankPageView extends StatelessWidget {
  const BankPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        context.read<BankQuestionIncrementCubit>().reset();
        context.read<BankTimerCubit>().resetTimer();
      },
      physics: const NeverScrollableScrollPhysics(),
      reverse: true,
      controller: pageController,
      children: List.generate(
        6,
        (index) => BankPageViewBlocBuilder(index: index),
      ),
    );
  }
}
