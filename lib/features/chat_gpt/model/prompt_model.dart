enum UserEnum {
  user,
  chatGpt,
}

class PromptModel {
  PromptModel({
    this.prompt,
    this.user,
    this.date,
  });
  String? prompt;
  UserEnum? user;
  DateTime? date;
}
