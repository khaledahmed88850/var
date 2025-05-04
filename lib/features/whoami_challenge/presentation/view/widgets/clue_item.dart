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
        Text('$index Clue', style: Styles.medium15),
        Text(clue, style: Styles.bold16),
        const Divider(thickness: 2),
      ],
    );
  }
}
