import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/custom_text_button.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/bank_challenge_cubit/bank_challenge_cubit.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/bank_question_increment_cubit/bank_question_increment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BankPageViewItem extends StatelessWidget {
  const BankPageViewItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BankQuestionIncrementCubit>();
    return BlocBuilder<BankChallengeCubit, BankChallengeState>(
      builder: (context, state) {
        if (state is BankChallengeSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  'السؤال ${cubit.questionIndex + 1}',
                  style: Styles.semiBold16,
                ),
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(minHeight: 150.h),

                  decoration: BoxDecoration(
                    color: AppColors.darkGreenBlue,

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      ' ${state.bankChallengeModelList[cubit.questionIndex].question} ؟',
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
                      state.bankChallengeModelList[cubit.questionIndex].answer,
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
                        Text(
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
                const SizedBox(height: 30),
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
              ],
            ),
          );
        } else if (state is BankChallengeFailure) {
          return Center(child: Text(state.message));
        } else {
          return Skeletonizer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'السؤال ${cubit.questionIndex + 1}',
                    style: Styles.semiBold16,
                  ),

                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: 150.h),

                    decoration: BoxDecoration(
                      color: AppColors.darkGreenBlue,

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Text('', style: Styles.bold16)),
                  ),
                  const SizedBox(height: 20),
                  const Text('الاجابة', style: Styles.semiBold16),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 60.h,
                      maxWidth: 250.w,
                    ),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.darkGreengrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(child: Text('', style: Styles.bold16)),
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
                          Text(
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
                  const SizedBox(height: 30),
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
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
