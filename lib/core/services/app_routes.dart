import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/get_it_services.dart';
import 'package:flutter_application_1/features/bank_challenge/data/repo/bank_challenge_repo.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/cubits/bank_challenge_cubit/bank_challenge_cubit.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/cubits/bank_question_increment_cubit/bank_question_increment_cubit.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/cubits/bank_timer_cubit/bank_timer_cubit.dart';
import 'package:flutter_application_1/features/bank_challenge/presentation/view/bank_challenge_view.dart';
import 'package:flutter_application_1/features/home/presentation/view/home_view.dart';
import 'package:flutter_application_1/features/password_challenge/domain/repo/password_challenge_repo.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/cubit/password_challenge_cubit.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/view/password_challenge_view.dart';
import 'package:flutter_application_1/features/risk_challenge/data/repo/risk_challenge_repo.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/cubits/risk_challenge_cubit/risk_challenge_cubit.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/cubits/risk_points_calculator_cubit/risk_point_calculator_cubit.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/risk_challenge_view.dart';
import 'package:flutter_application_1/features/whoami_challenge/data/repo/whoami_repo.dart';
import 'package:flutter_application_1/features/whoami_challenge/presentation/cubit/whoami_cubit.dart';
import 'package:flutter_application_1/features/whoami_challenge/presentation/view/whoami_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case RiskChallengeView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt.get<RiskPointCalculatorCubit>(),
                ),
                BlocProvider(
                  create:
                      (context) =>
                          RiskChallengeCubit(getIt<RiskChallengeRepo>())
                            ..emitRiskChallengeStates(),
                ),
              ],
              child: const RiskChallengeView(),
            ),
      );
    case PasswordChallengeView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create:
                  (context) =>
                      PasswordChallengeCubit(getIt.get<PasswordChallengeRepo>())
                        ..getPasswordChallenge(),
              child: const PasswordChallengeView(),
            ),
      );
    case BankChallengeView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => BankTimerCubit()),
                BlocProvider(
                  create:
                      (context) =>
                          BankChallengeCubit(getIt<BankChallengeRepo>())
                            ..emitBankChallengeStates(),
                ),
                BlocProvider(create: (context) => BankQuestionIncrementCubit()),
              ],
              child: const BankChallengeView(),
            ),
      );
    case WhoamiView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create:
                  (context) =>
                      WhoamiCubit(getIt<WhoamiRepo>())..getWhoamiChallenge(),
              child: const WhoamiView(),
            ),
      );
    default:
      return null;
  }
}
