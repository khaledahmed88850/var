import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bank_question_increment_state.dart';

class BankQuestionIncrementCubit extends Cubit<BankQuestionIncrementState> {
  BankQuestionIncrementCubit() : super(BankQuestionIncrementInitial());
  int counter = 0;
  int score1 = 0;
  int score2 = 0;
  int questionIndex = 0;
  void incrementConter() {
    int index = questionIndex + 1;
    if (index <= 11) {
      if (counter == 0) {
        counter += 1;
      } else if (counter == 1) {
        counter += 3;
      } else {
        counter += counter;
      }
    }
    incrementQuestionIndex();
  }

  void resetCounter() {
    counter = 0;
    incrementQuestionIndex();
  }

  void reset() {
    questionIndex = 0;
    counter = 0;

    emit(Reset());
  }

  void incrementQuestionIndex() {
    if (questionIndex < 11) {
      questionIndex += 1;
      emit(QuestionIncrement());
    }
  }

  void saveScore({required int teamNumber}) {
    switch (teamNumber) {
      case 1:
        score1 += counter;
        counter = 0;
        break;
      case 2:
        score2 += counter;
        counter = 0;
        break;
    }
    emit(SaveScore());
  }
}
