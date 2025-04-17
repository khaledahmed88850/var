import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/widgets/bank_page_view.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/widgets/rounds_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_text_styles.dart';

class BankChallengeViewBody extends StatelessWidget {
  const BankChallengeViewBody({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder:
                (context, index) => GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: RoundsWidget(
                    index: index,
                    selectedIndex: pageController.page?.toInt() ?? 0,
                  ),
                ),
          ),
        ),

        Expanded(child: BankPageView(pageController: pageController)),

        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('الفريق الأول', style: Styles.bold16),

            Text('14', style: Styles.bold16),
          ],
        ),
        SizedBox(height: 20.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('الفريق الثاني', style: Styles.bold16),

            Text('18', style: Styles.bold16),
          ],
        ),
        SizedBox(height: 80.h),
      ],
    );
  }
}
