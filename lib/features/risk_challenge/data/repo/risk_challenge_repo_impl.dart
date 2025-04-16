import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failures.dart';
import 'package:flutter_application_1/core/services/database_services.dart';
import 'package:flutter_application_1/core/utils/firebase_endpoints.dart';
import 'package:flutter_application_1/features/risk_challenge/data/model/risk_challenge_model.dart';
import 'package:flutter_application_1/features/risk_challenge/data/repo/risk_challenge_repo.dart';

class RiskChallengeRepoImpl implements RiskChallengeRepo {
  final DataBaseServices dataBaseServices;

  RiskChallengeRepoImpl({required this.dataBaseServices});
  @override
  Future<Either<Failures, List<RiskChallengeModel>>>
  getRandomCategories() async {
    try {
      var data = await dataBaseServices.getRandomDocuments(
        path: FirebaseEndpoints.riskChallenge,
        limit: 4,
      );
      List<RiskChallengeModel> list =
          data.map((e) => RiskChallengeModel.fromJson(e)).toList();
      return Right(list);
    } on Exception {
      return Left(
        ServerFailure(message: 'Something went wrong , please try again'),
      );
    }
  }
}
