import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'risk_point_calculator_state.dart';

class RiskPointCalculatorCubit extends Cubit<RiskPointCalculatorState> {
  RiskPointCalculatorCubit() : super(RiskPointCalculatorInitial());

  num firstTeamPoints = 0;
  num secondTeamPoints = 0;
  void addPoints({required num value, required int teamId}) {
    switch (teamId) {
      case 1:
        if (firstTeamPoints < 1000 && firstTeamPoints + value <= 1000) {
          firstTeamPoints += value;
          emit(RiskAddPoints());
        }
      case 2:
        if (secondTeamPoints < 1000 && secondTeamPoints + value <= 1000) {
          secondTeamPoints += value;
          emit(RiskAddPoints());
        }
      default:
        break;
    }
  }

  void removePoints({required num value, required int teamId}) {
    switch (teamId) {
      case 1:
        if (firstTeamPoints > 0 && firstTeamPoints >= value) {
          firstTeamPoints -= value;
          emit(RiskRemovePoints());
        }
      case 2:
        if (secondTeamPoints > 0 && secondTeamPoints >= value) {
          secondTeamPoints -= value;
          emit(RiskRemovePoints());
        }
      default:
        break;
    }
  }
}
