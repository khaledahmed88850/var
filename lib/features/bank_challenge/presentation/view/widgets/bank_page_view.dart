import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/widgets/bank_page_view_item.dart';

class BankPageView extends StatelessWidget {
  const BankPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      reverse: true,
      controller: pageController,
      children: const [
        BankPageViewItem(),
        BankPageViewItem(),
        BankPageViewItem(),
        BankPageViewItem(),
        BankPageViewItem(),
      ],
    );
  }
}
