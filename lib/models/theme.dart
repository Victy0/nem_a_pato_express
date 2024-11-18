import 'package:nem_a_pato_app/models/question.dart';

class Theme {
  final String theme;
  final List<Question> questions;

  Theme({required this.theme, required this.questions});

  factory Theme.fromJson(Map<String, dynamic> json) {
    var list = json['questions'] as List;
    List<Question> questionsList =
        list.map((i) => Question.fromJson(i)).toList();

    return Theme(
      theme: json['theme'],
      questions: questionsList,
    );
  }
}