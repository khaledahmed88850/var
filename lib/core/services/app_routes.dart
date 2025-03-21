import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/view/home_view.dart';
import 'package:flutter_application_1/features/password_challenge/presentation/view/password_challenge_view.dart'
    show PasswordChallengeView;

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case PasswordChallengeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const PasswordChallengeView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}
