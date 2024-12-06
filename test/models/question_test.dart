import 'package:flutter_test/flutter_test.dart';
import 'package:nem_a_pato_app/models/question.dart';

void main() {
  group('Question Tests', () {
    test('Constructor should correctly assign values', () {
      String questionText = "Question?";
      int answerValue = 1;

      Question question = Question(question: questionText, answer: answerValue);

      expect(question.question, questionText);
      expect(question.answer, answerValue);
      expect(question.theme, '');
    });

    test('fromJson should correctly create Question from JSON', () {
      Map<String, dynamic> json = {
        'question': 'Question?',
        'answer': 1,
      };

      Question question = Question.fromJson(json);

      expect(question.question, 'Question?');
      expect(question.answer, 1);
    });

    test('setTheme should correctly set the theme', () {
      Question question = Question(question: "Question?", answer: 1);

      question.setTheme("Theme");

      expect(question.theme, "Theme");
    });
  });
}