class Question {
  String? q1;
  List<String>? q1Options;
  int? q1IsMultiChoice;
  String? q1Trigger;
  String? q2;
  List<String>? q2Options;

  Question(
      {this.q1,
      this.q1Options,
      this.q1IsMultiChoice,
      this.q1Trigger,
      this.q2,
      this.q2Options});

  Question.fromJson(Map<String, dynamic> json) {
    q1 = json['q1'];
    q1Options = json['q1_options'].cast<String>();
    q1IsMultiChoice = json['q1_is_multi_choice'];
    q1Trigger = json['q1_trigger'];
    q2 = json['q2'];
    if (json['q2_options'] != null) {
      q2Options = <String>[];
      json['q2_options'].forEach((v) {
        q2Options!.add(v);
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['q1'] = q1;
    data['q1_options'] = q1Options;
    data['q1_is_multi_choice'] = q1IsMultiChoice;
    data['q1_trigger'] = q1Trigger;
    data['q2'] = q2;
    data['q2_options'] = q2Options;
    return data;
  }
}
