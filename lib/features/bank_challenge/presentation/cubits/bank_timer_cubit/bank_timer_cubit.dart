import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bank_timer_state.dart';

class BankTimerCubit extends Cubit<BankTimerState> {
  BankTimerCubit() : super(BankTimerInitial());
  Timer? timer;
  int start = 120;
  static const oneSec = Duration(seconds: 1);
  void startTimer() {
    if (timer == null) {
      timer = Timer.periodic(oneSec, (timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
          emit(BankTimerStarted());
        }
      });
    } else {}
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
      emit(BankTimerStopped());
    }
  }

  void resetTimer() {
    if (timer != null) {
      timer!.cancel();
    }
    timer = null;
    start = 120;
    emit(BankTimerReset());
  }
}
