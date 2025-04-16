import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/risk_challenge/data/model/risk_challenge_model.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/widgets/risk_challenge_questions_card.dart';

class RiskChallengeCategory extends StatelessWidget {
  const RiskChallengeCategory({super.key, required this.riskChallengeModel});
  final RiskChallengeModel riskChallengeModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.33,
        width: double.infinity,
        decoration: const ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: AppColors.seaGreen, width: 2),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(
              riskChallengeModel.name,
              style: Styles.bold23.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.7,
                ),
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  List<String> questions = [
                    riskChallengeModel.question1,
                    riskChallengeModel.question2,
                    riskChallengeModel.question3,
                    riskChallengeModel.question4,
                  ];
                  List<String> answers = [
                    riskChallengeModel.answer1,
                    riskChallengeModel.answer2,
                    riskChallengeModel.answer3,
                    riskChallengeModel.answer4,
                  ];
                  return RiskChallengeQuestionsCard(
                    question: questions[index],
                    answer: answers[index],
                    index: (pow(2, num.parse(index.toString())) * 5),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
