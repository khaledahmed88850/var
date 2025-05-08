import 'package:flutter_application_1/features/bank_challenge/data/model/bank_challenge_model.dart';

List<List<BankChallengeModel>> handleBankChallengeList({
  required List<BankChallengeModel> myList,
}) {
  List<List<BankChallengeModel>> result = [];
  for (int i = 0; i < myList.length; i += 12) {
    List<BankChallengeModel> newList = [];
    for (int j = i; j < i + 12; j++) {
      newList.add(myList[j]);
    }
    result.add(newList);
  }
  return result;
}

const BankChallengeModel dummyBankChallengeModel = BankChallengeModel(
  question: 'asd asdasd asdasd ',
  answer: 'asdasda',
);
const List<BankChallengeModel> dummyBankChallengeModelList = [
  dummyBankChallengeModel,
];
const List<List<BankChallengeModel>> dummyBankChallengeModelListList = [
  dummyBankChallengeModelList,
];
