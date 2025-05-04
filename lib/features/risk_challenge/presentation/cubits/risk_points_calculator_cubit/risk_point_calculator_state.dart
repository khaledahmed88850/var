part of 'risk_point_calculator_cubit.dart';

@immutable
sealed class RiskPointCalculatorState {}

final class RiskPointCalculatorInitial extends RiskPointCalculatorState {}

final class RiskAddPoints extends RiskPointCalculatorState {}

final class RiskRemovePoints extends RiskPointCalculatorState {}
