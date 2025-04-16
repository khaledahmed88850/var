class RiskChallengeModel {
  final String name;
  final String question1;
  final String answer1;
  final String question2;
  final String answer2;
  final String question3;
  final String answer3;
  final String question4;
  final String answer4;

  RiskChallengeModel({
    required this.name,
    required this.question1,
    required this.answer1,
    required this.question2,
    required this.answer2,
    required this.question3,
    required this.answer3,
    required this.question4,
    required this.answer4,
  });
  factory RiskChallengeModel.fromJson(Map<String, dynamic> json) {
    return RiskChallengeModel(
      name: json['name'],
      question1: json['question1'],
      answer1: json['answer1'],
      question2: json['question2'],
      answer2: json['answer2'],
      question3: json['question3'],
      answer3: json['answer3'],
      question4: json['question4'],
      answer4: json['answer4'],
    );
  }
}
