import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/view/widgets/flipping_card_widget.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';

class PasswordChallengePlayerCard extends StatelessWidget {
  const PasswordChallengePlayerCard({super.key, required this.index});
  final String index;
  @override
  Widget build(BuildContext context) {
    final FlipCardController con1 = FlipCardController();

    return FlipCard(
      rotateSide: RotateSide.right,
      onTapFlipping: true,

      axis: FlipAxis.vertical,
      controller: con1,
      frontWidget: FlippingCardWidget(isFlipped: false, title: index),
      backWidget: const FlippingCardWidget(title: 'مارادونا', isFlipped: true),
    );
  }
}
