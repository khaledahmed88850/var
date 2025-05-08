import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_text_button.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/cubits/bank_timer_cubit/bank_timer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankChallengeTimerControl extends StatelessWidget {
  const BankChallengeTimerControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTextButton(
          text: 'توقف',
          onPressed: () {
            context.read<BankTimerCubit>().stopTimer();
          },
        ),
        CustomTextButton(
          text: 'ابدأ',
          onPressed: () {
            context.read<BankTimerCubit>().startTimer();
          },
        ),
        CustomTextButton(
          text: 'اعادة',
          onPressed: () {
            context.read<BankTimerCubit>().resetTimer();
          },
        ),
      ],
    );
  }
}
