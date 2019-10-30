class Question {
  String questionText;
  bool questionAnswer;

  // 另外一種constructors的更簡易寫法
  // https://dart.dev/guides/language/language-tour#constructors
  // Question( {this.questionText, this.questionAnswer} )
  Question({String q, bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}
