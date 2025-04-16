import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

class RiskChallengeQuestionsCard extends StatefulWidget {
  const RiskChallengeQuestionsCard({
    super.key,
    required this.index,
    required this.question,
    required this.answer,
  });
  final num index;
  final String question, answer;

  @override
  State<RiskChallengeQuestionsCard> createState() =>
      _RiskChallengeQuestionsCardState();
}

class _RiskChallengeQuestionsCardState
    extends State<RiskChallengeQuestionsCard> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = true;
        });
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Column(
                  children: [
                    Center(child: Text(widget.question, style: Styles.bold16)),
                    const Divider(),
                    Center(child: Text(widget.answer, style: Styles.bold15)),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                ],
              ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:
                isPressed
                    ? [const Color(0xFF403939), const Color(0xFF403939)]
                    : [AppColors.deepGreen, AppColors.seaGreen],
          ),

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        child: Center(child: Text('${widget.index}', style: Styles.bold23)),
      ),
    );
  }
}
