import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failures.dart';
import 'package:flutter_application_1/features/password_challenge/data/models/password_challenge_model.dart';

abstract class PasswordChallengeRepo {
  Future<Either<Failures, List<PasswordChallengeModel>>> getPasswordChallenge();
}
