import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/bank_challenge/data/model/bank_challenge_model.dart';
import 'package:flutter_application_1/features/bank_challenge/data/repo/bank_challenge_repo.dart';
import 'package:meta/meta.dart';

part 'bank_challenge_state.dart';

class BankChallengeCubit extends Cubit<BankChallengeState> {
  BankChallengeCubit(this.bankChallengeRepo) : super(BankChallengeInitial());
  final BankChallengeRepo bankChallengeRepo;

  Future emitBankChallengeStates() async {
    emit(BankChallengeLoading());
    var result = await bankChallengeRepo.getRandomDocuments();
    result.fold(
      (f) => emit(BankChallengeFailure(message: f.message)),
      (list) => emit(BankChallengeSuccess(bankChallengeModelList: list)),
    );
  }
}
