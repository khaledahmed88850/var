import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failures.dart';
import 'package:flutter_application_1/core/helper/bank_challenge_helper_functions.dart';
import 'package:flutter_application_1/core/services/database_services.dart';
import 'package:flutter_application_1/core/utils/firebase_endpoints.dart';
import 'package:flutter_application_1/features/bank_challenge/data/model/bank_challenge_model.dart';
import 'package:flutter_application_1/features/bank_challenge/data/repo/bank_challenge_repo.dart';

class BankChallengeRepoImpl implements BankChallengeRepo {
  final DataBaseServices dataBaseServices;

  BankChallengeRepoImpl({required this.dataBaseServices});
  @override
  Future<Either<Failures, List<List<BankChallengeModel>>>>
  getRandomDocuments() async {
    try {
      var data = await dataBaseServices.getData(
        path: FirebaseEndpoints.bankChallenge,
        limit: 72,
      );
      List<BankChallengeModel> list =
          data.map((e) => BankChallengeModel.fromJson(e)).toList();
      List<List<BankChallengeModel>> bankList = handleBankChallengeList(
        myList: list,
      );
      return Right(bankList);
    } catch (e) {
      return Left(
        ServerFailure(message: 'Something went wrong , please try again'),
      );
    }
  }
}
