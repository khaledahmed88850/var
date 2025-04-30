import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failures.dart';
import 'package:flutter_application_1/features/bank_challenge/data/model/bank_challenge_model.dart';

abstract class BankChallengeRepo {
  Future<Either<Failures, List<BankChallengeModel>>> getRandomDocuments();
}
