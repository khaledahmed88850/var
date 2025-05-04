import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failures.dart';
import 'package:flutter_application_1/core/services/database_services.dart';
import 'package:flutter_application_1/core/utils/firebase_endpoints.dart';
import 'package:flutter_application_1/features/whoami_challenge/data/model/whoami_model.dart';

class WhoamiRepo {
  final DataBaseServices dataBaseServices;

  WhoamiRepo({required this.dataBaseServices});
  Future<Either<Failures, WhoamiModel>> getRandomPlayer() async {
    try {
      var data = await dataBaseServices.getRandomSingleDocument(
        path: FirebaseEndpoints.whoamiChallenge,
      );
      return right(WhoamiModel.fromJson(data));
    } on Exception {
      return left(
        ServerFailure(message: 'Something went wrong , please try again'),
      );
    }
  }
}
