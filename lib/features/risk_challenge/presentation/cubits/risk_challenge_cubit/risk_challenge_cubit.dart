import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/risk_challenge/data/model/risk_challenge_model.dart';
import 'package:flutter_application_1/features/risk_challenge/data/repo/risk_challenge_repo.dart';
import 'package:meta/meta.dart';

part 'risk_challenge_state.dart';

class RiskChallengeCubit extends Cubit<RiskChallengeState> {
  RiskChallengeCubit(this.riskChallengeRepo) : super(RiskChallengeInitial());
  final RiskChallengeRepo riskChallengeRepo;

  Future<void> emitRiskChallengeStates() async {
    emit(RiskChallengeLoading());
    final result = await riskChallengeRepo.getRandomCategories();
    result.fold(
      (failure) => emit(RiskChallengeFailure(message: failure.message)),
      (list) => emit(RiskChallengeSuccess(riskChallengeModelList: list)),
    );
  }
}
