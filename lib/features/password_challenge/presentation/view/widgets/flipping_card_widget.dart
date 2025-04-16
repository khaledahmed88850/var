import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/password_challenge/data/models/password_challenge_model.dart';
import 'package:url_launcher/url_launcher.dart';

class FlippingCardWidget extends StatelessWidget {
  const FlippingCardWidget({super.key, required this.passwordChallengeModel});
  final PasswordChallengeModel passwordChallengeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        gradient: LinearGradient(
          colors: [AppColors.darkBlueGrey, AppColors.brightTeal],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Text(passwordChallengeModel.name, style: Styles.bold15),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              await launchUrl(Uri.parse(passwordChallengeModel.url));
            },
            child: Text(
              'تفاصيل عن اللاعب',
              style: Styles.bold13.copyWith(color: Colors.black87),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
