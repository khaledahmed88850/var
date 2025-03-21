import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

class FlippingCardWidget extends StatelessWidget {
  const FlippingCardWidget({
    super.key,
    required this.title,
    required this.isFlipped,
  });
  final String title;
  final bool isFlipped;
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Text(title, style: Styles.bold23),
          const Spacer(),
          Visibility(
            visible: isFlipped,
            maintainSize: true,
            maintainState: true,
            maintainInteractivity: true,
            maintainAnimation: true,
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
