import 'package:flutter_test/flutter_test.dart';
import 'package:nem_a_pato_app/models/theme.dart';
import 'package:nem_a_pato_app/models/question.dart';

void main() {
  group('Theme Tests', () {
    test('Constructor should correctly assign values', () {
      String themeName = "Theme";
      List<Question> questionsList = [
        Question(question: "Question 1?", answer: 1),
        Question(question: "Question 2?", answer: 2)
      ];

      Theme theme = Theme(theme: themeName, questions: questionsList);

      expect(theme.theme, themeName);
      expect(theme.questions.length, 2);
      expect(theme.questions[0].question, "Question 1?");
      expect(theme.questions[1].question, "Question 2?");
    });

    test('fromJson should correctly create Theme from JSON', () {
      Map<String, dynamic> json = {
        'theme': 'Theme',
        'questions': [
          {'question': 'Question 1?', 'answer': 1},
          {'question': 'Question 2?', 'answer': 2}
        ]
      };

      Theme theme = Theme.fromJson(json);

      expect(theme.theme, 'Theme');
      expect(theme.questions.length, 2);
      expect(theme.questions[0].question, 'Question 1?');
      expect(theme.questions[1].question, 'Question 2?');
    });
  });
}