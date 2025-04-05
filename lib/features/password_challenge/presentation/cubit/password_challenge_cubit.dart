import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/password_challenge/data/models/password_challenge_model.dart';
import 'package:flutter_application_1/features/password_challenge/domain/repo/password_challenge_repo.dart';
import 'package:meta/meta.dart';

part 'password_challenge_state.dart';

class PasswordChallengeCubit extends Cubit<PasswordChallengeState> {
  PasswordChallengeCubit(this.passwordChallengeRepo)
    : super(PasswordChallengeInitial());
  final PasswordChallengeRepo passwordChallengeRepo;

  Future<void> getPasswordChallenge() async {
    emit(PasswordChallengeLoading());
    final result = await passwordChallengeRepo.getPasswordChallenge();
    result.fold(
      (l) => emit(PasswordChallengeFailure(message: l.message)),
      (r) => emit(PasswordChallengeSuccess(passwordChallengeModelList: r)),
    );
  }
}
