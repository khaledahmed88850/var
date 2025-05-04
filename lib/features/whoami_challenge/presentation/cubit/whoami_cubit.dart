import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/whoami_challenge/data/model/whoami_model.dart';
import 'package:flutter_application_1/features/whoami_challenge/data/repo/whoami_repo.dart';
import 'package:meta/meta.dart';

part 'whoami_state.dart';

class WhoamiCubit extends Cubit<WhoamiState> {
  WhoamiCubit(this.whoamiRepo) : super(WhoamiInitial());
  final WhoamiRepo whoamiRepo;

  Future<void> getWhoamiChallenge() async {
    emit(WhoamiLoading());
    final result = await whoamiRepo.getRandomPlayer();
    result.fold(
      (error) => emit(WhoamiFailure(message: error.message)),
      (whoamiModel) => emit(WhoamiSuccess(whoamiModel: whoamiModel)),
    );
  }
}
