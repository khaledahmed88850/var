import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

class ClueItem extends StatelessWidget {
  const ClueItem({super.key, required this.index, required this.clue});
  final int index;
  final String clue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'الدليل ${getIndexNameInArabic(index: index)}',
          style: Styles.regular13,
        ),
        const SizedBox(height: 6),
        Text(clue, style: Styles.bold16),
        const Divider(thickness: 2),
      ],
    );
  }

  String getIndexNameInArabic({required int index}) {
    switch (index) {
      case 1:
        return 'الأول';
      case 2:
        return 'الثاني';
      case 3:
        return 'الثالث';
      case 4:
        return 'الرابع';
      case 5:
        return 'الخامس';
      default:
        return '';
    }
  }
}
