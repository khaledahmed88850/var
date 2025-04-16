part of 'risk_challenge_cubit.dart';

@immutable
sealed class RiskChallengeState {}

final class RiskChallengeInitial extends RiskChallengeState {}

final class RiskChallengeLoading extends RiskChallengeState {}

final class RiskChallengeSuccess extends RiskChallengeState {
  final List<RiskChallengeModel> riskChallengeModelList;
  RiskChallengeSuccess({required this.riskChallengeModelList});
}

final class RiskChallengeFailure extends RiskChallengeState {
  final String message;
  RiskChallengeFailure({required this.message});
}
