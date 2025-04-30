class WhoamiModel {
  final String clue1;
  final String clue2;
  final String clue3;
  final String clue4;
  final String clue5;
  final String answer;

  WhoamiModel({
    required this.clue1,
    required this.clue2,
    required this.clue3,
    required this.clue4,
    required this.clue5,
    required this.answer,
  });

  factory WhoamiModel.fromJson(Map<String, dynamic> json) {
    return WhoamiModel(
      clue1: json['clue1'],
      clue2: json['clue2'],
      clue3: json['clue3'],
      clue4: json['clue4'],
      clue5: json['clue5'],
      answer: json['answer'],
    );
  }
}
