import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failures.dart';
import 'package:flutter_application_1/core/services/database_services.dart';
import 'package:flutter_application_1/core/utils/firebase_endpoints.dart';
import 'package:flutter_application_1/features/password_challenge/data/models/password_challenge_model.dart';
import 'package:flutter_application_1/features/password_challenge/domain/repo/password_challenge_repo.dart';

class PasswordChallengeRepoImpl implements PasswordChallengeRepo {
  final DataBaseServices dataBaseServices;

  PasswordChallengeRepoImpl(this.dataBaseServices);
  @override
  Future<Either<Failures, List<PasswordChallengeModel>>>
  getPasswordChallenge() async {
    try {
      var data = await dataBaseServices.getRandomDocuments(
        path: FirebaseEndpoints.passwordChallenge,
        limit: 8,
      );
      List<PasswordChallengeModel> list =
          data.map((e) => PasswordChallengeModel.fromJson(e)).toList();

      return Right(list);
    } on Exception {
      return Left(
        ServerFailure(message: 'Something went wrong , please try again'),
      );
    }
  }
}
