import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/custom_text_button.dart';
import 'package:flutter_application_1/features/bank_challenge/data/model/bank_challenge_model.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/cubits/bank_question_increment_cubit/bank_question_increment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/bank_timer_cubit/bank_timer_cubit.dart';
import 'bank_challenge_timer_control.dart';

class BankPageViewItem extends StatelessWidget {
  const BankPageViewItem({
    super.key,
    required this.index,
    required this.bankChallengeModelList,
    this.isDummy = false,
  });

  final int index;
  final List<List<BankChallengeModel>> bankChallengeModelList;
  final bool isDummy;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BankQuestionIncrementCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text('السؤال ${cubit.questionIndex + 1}', style: Styles.semiBold16),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 120.h),
            padding: const EdgeInsets.all(24),

            decoration: BoxDecoration(
              color: AppColors.darkGreenBlue,

              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                '${bankChallengeModelList[index][cubit.questionIndex].question}؟',
                style: Styles.bold16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('الاجابة', style: Styles.semiBold16),
          Container(
            constraints: BoxConstraints(minHeight: 60.h, maxWidth: 250.w),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.darkGreengrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                bankChallengeModelList[index][cubit.questionIndex].answer,
                style: Styles.bold16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                textDirection: TextDirection.ltr,
                children: [
                  const Text(' :Counter', style: Styles.semiBold16),
                  isDummy
                      ? const SizedBox.shrink()
                      : Text(
                        "${context.watch<BankQuestionIncrementCubit>().counter}",
                        style: Styles.bold16,
                      ),
                ],
              ),
              CustomTextButton(
                text: 'Bank',
                onPressed: () {
                  cubit.saveScore(teamNumber: index % 2 == 0 ? 2 : 1);
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButton(
                onPressed: () {
                  cubit.incrementConter();
                },
                text: 'إجابة صحيحة',
                textColor: const Color(0xFF19811D),
              ),
              CustomTextButton(
                onPressed: () {
                  cubit.resetCounter();
                },
                text: 'إجابة خاطئة',
                textColor: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '${context.watch<BankTimerCubit>().start} ثانية ',
            style: Styles.bold19.copyWith(
              color: const Color.fromARGB(255, 17, 183, 192),
            ),
          ),
          const SizedBox(height: 8),
          const BankChallengeTimerControl(),
        ],
      ),
    );
  }
}
