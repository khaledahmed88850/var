import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/cubits/bank_timer_cubit/bank_timer_cubit.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/widgets/bank_challenge_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: buildAppBar(
        context: context,
        title: 'بنك',
        onPressed: () {
          context.read<BankTimerCubit>().resetTimer();
          Navigator.pop(context);
        },
      ),
      body: BankChallengeViewBody(pageController: pageController),
    );
  }
}
