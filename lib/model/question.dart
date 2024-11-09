class Question {
  final String question;
  final int answer;
  String theme = '';

  Question({required this.question, required this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      answer: json['answer'],
    );
  }

  setTheme(String theme) {
    this.theme = theme;
  }
}