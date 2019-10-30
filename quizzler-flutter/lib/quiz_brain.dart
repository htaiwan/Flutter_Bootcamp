import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> questions = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
  ];

  void nextQuestion() {
    if (_questionNumber < questions.length - 1) {
      _questionNumber++;
    }
  }

  String showQuestion() {
    return questions[_questionNumber].questionText;
  }

  bool checkAnswer({bool userPickAnswer}) {
    return questions[_questionNumber].questionAnswer == userPickAnswer;
  }
}
