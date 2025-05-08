class BankChallengeModel {
  final String question;
  final String answer;

  const BankChallengeModel({required this.question, required this.answer});
  factory BankChallengeModel.fromJson(Map<String, dynamic> json) =>
      BankChallengeModel(question: json['question'], answer: json['answer']);
}
