import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

class UnflippedCardWidget extends StatelessWidget {
  const UnflippedCardWidget({super.key, required this.index});
  final String index;
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
          colors: [Color(0xff522cfd), Color(0xFF836EB2)],
        ),
      ),
      child: Center(child: Text(index, style: Styles.bold23)),
    );
  }
}
