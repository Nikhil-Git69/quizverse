class Questions {
  late String questionText;
  late final List<String> answersList;
  late String correctAnswer;

  late List<int> answerWeight;

  List<String> getShuffledAnswers()
  {
    final shuffleList = List<String>.from(answersList);//Using answerList makes shuffleList and answerList point to same list making it noshuffle,
    shuffleList.shuffle();
    return shuffleList;
  }//This didn't shuffle shit either

  Questions(this.questionText, this.answersList, this.correctAnswer, this.answerWeight);
}
