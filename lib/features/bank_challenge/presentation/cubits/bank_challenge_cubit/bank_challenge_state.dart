part of 'bank_challenge_cubit.dart';

@immutable
sealed class BankChallengeState {}

final class BankChallengeInitial extends BankChallengeState {}

final class BankChallengeLoading extends BankChallengeState {}

final class BankChallengeSuccess extends BankChallengeState {
  final List<List<BankChallengeModel>> bankChallengeModelList;
  BankChallengeSuccess({required this.bankChallengeModelList});
}

final class BankChallengeFailure extends BankChallengeState {
  final String message;
  BankChallengeFailure({required this.message});
}
