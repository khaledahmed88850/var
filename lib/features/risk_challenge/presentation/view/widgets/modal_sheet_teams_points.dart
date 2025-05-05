import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/get_it_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/risk_points_calculator_cubit/risk_point_calculator_cubit.dart';
import 'modal_sheet_teams_points_body.dart';

class ModalSheetTeamsPoints extends StatelessWidget {
  const ModalSheetTeamsPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<RiskPointCalculatorCubit>(),
      child: const ModalSheetTeamsPointsBody(),
    );
  }
}
