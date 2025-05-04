import 'package:flutter_application_1/core/services/database_services.dart';
import 'package:flutter_application_1/core/services/firestore_services.dart';
import 'package:flutter_application_1/features/bank_challenge/data/repo/bank_challenge_repo.dart';
import 'package:flutter_application_1/features/bank_challenge/data/repo/bank_challenge_repo_impl.dart';
import 'package:flutter_application_1/features/password_challenge/data/repo/password_challenge_repo_impl.dart';
import 'package:flutter_application_1/features/password_challenge/domain/repo/password_challenge_repo.dart';
import 'package:flutter_application_1/features/risk_challenge/data/repo/risk_challenge_repo.dart';
import 'package:flutter_application_1/features/risk_challenge/data/repo/risk_challenge_repo_impl.dart';
import 'package:flutter_application_1/features/whoami_challenge/data/repo/whoami_repo.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DataBaseServices>(FirestoreServices());
  getIt.registerSingleton<PasswordChallengeRepo>(
    PasswordChallengeRepoImpl(getIt.get<DataBaseServices>()),
  );
  getIt.registerSingleton<RiskChallengeRepo>(
    RiskChallengeRepoImpl(dataBaseServices: getIt.get<DataBaseServices>()),
  );
  getIt.registerSingleton<BankChallengeRepo>(
    BankChallengeRepoImpl(dataBaseServices: getIt.get<DataBaseServices>()),
  );
  getIt.registerSingleton<WhoamiRepo>(
    WhoamiRepo(dataBaseServices: getIt.get<DataBaseServices>()),
  );
}
