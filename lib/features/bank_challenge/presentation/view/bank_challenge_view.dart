import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/widgets/bank_challenge_view_body.dart';

class BankChallengeView extends StatefulWidget {
  const BankChallengeView({super.key});
  static const String routeName = '/bankChallenge';

  @override
  State<BankChallengeView> createState() => _BankChallengeViewState();
}

class _BankChallengeViewState extends State<BankChallengeView> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('بنك', style: Styles.bold28),
        centerTitle: true,
      ),
      body: BankChallengeViewBody(pageController: pageController),
    );
  }
}
