class PasswordChallengeModel {
  final String name;
  final String url;
  const PasswordChallengeModel({required this.name, required this.url});
  factory PasswordChallengeModel.fromJson(json) {
    return PasswordChallengeModel(name: json['name'], url: json['url']);
  }
  toJson() {
    return {'name': name, 'url': url};
  }
}
