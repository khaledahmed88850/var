part of 'password_challenge_cubit.dart';

@immutable
sealed class PasswordChallengeState {}

final class PasswordChallengeInitial extends PasswordChallengeState {}

final class PasswordChallengeLoading extends PasswordChallengeState {}

final class PasswordChallengeSuccess extends PasswordChallengeState {
  final List<PasswordChallengeModel> passwordChallengeModelList;
  PasswordChallengeSuccess({required this.passwordChallengeModelList});
}

final class PasswordChallengeFailure extends PasswordChallengeState {
  final String message;
  PasswordChallengeFailure({required this.message});
}
