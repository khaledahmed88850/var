import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/get_it_services.dart';
import 'package:flutter_application_1/features/home/presentation/view/home_view.dart';
import 'package:flutter_application_1/features/password_challenge/domain/repo/password_challenge_repo.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/cubit/password_challenge_cubit.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/view/password_challenge_view.dart'
    show PasswordChallengeView;
import 'package:flutter_application_1/features/risk_challenge/data/repo/risk_challenge_repo.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/cubit/risk_challenge_cubit.dart';
import 'package:flutter_application_1/features/risk_challenge/presentation/view/risk_challenge_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case RiskChallengeView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create:
                  (context) =>
                      RiskChallengeCubit(getIt<RiskChallengeRepo>())
                        ..emitRiskChallengeStates(),
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
    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}
