import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/risk_points_calculator_cubit/risk_point_calculator_cubit.dart';

class AddOrRemovePoints extends StatelessWidget {
  const AddOrRemovePoints({
    super.key,
    required this.value,
    required this.teamId,
  });
  final num value;
  final int teamId;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.read<RiskPointCalculatorCubit>().addPoints(
              value: value,
              teamId: teamId,
            );
          },
          icon: const Icon(Icons.add_circle_outline_rounded),
        ),
        Text('$value', style: Styles.bold16, textAlign: TextAlign.center),
        IconButton(
          onPressed: () {
            context.read<RiskPointCalculatorCubit>().removePoints(
              value: value,
              teamId: teamId,
            );
          },
          icon: const Icon(Icons.remove_circle_outline),
        ),
      ],
    );
  }
}
