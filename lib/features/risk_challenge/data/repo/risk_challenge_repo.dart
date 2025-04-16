import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failures.dart';
import 'package:flutter_application_1/features/risk_challenge/data/model/risk_challenge_model.dart';

abstract class RiskChallengeRepo {
  Future<Either<Failures, List<RiskChallengeModel>>> getRandomCategories();
}
