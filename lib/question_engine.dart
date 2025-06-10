
import 'dart:ffi';

import 'Question.dart';

class QuestionEngine {
 int questionNumber = 0;
  int correctAnswers = 0;
int MaxScore= 0;

  final QuestionList = [
    Questions(
      'Which planet is closest to the sun?',
      ['Earth', 'Mars', 'Jupiter', 'Mercury'],
      'Mercury',
      [0, 0, 0, 10],
    ),

    Questions(
      'Who was the first man in space?',
      ['Yuri Gagarin', 'Freddy Mercury', 'Charles Babbage', 'Sailor Moon'],
      'Yuri Gagarin',
      [10, 0, 0, 0],

    ),
    Questions(
      'What is at the center of the Milky Way galaxy',
      ['Sun', 'Another Galaxy', 'A Black Hole', 'Jupiter'],
      'A Black Hole',
      [0, 0, 10, 0],

    ),
    Questions(
      ' What accounts for approximately 85% of matter in the universe??',
      ['White Matter', 'Dark Matter', 'Blue Matter', 'No Matter'],
      'Dark Matter',
      [0, 10, 0, 0],

    ),
    Questions(
      'How many stars are in the Milky Way?',
      ['10-50 Billion', '500 Billion-1 Trillion', '10 Trillion', '100-500 Billion'],
      '100-500 Billion',
      [0, 0, 0, 10],

    ),


  ];




   int getQuestionsCount() {
     return QuestionList.length;
   }

   void nextQuestion() {
     if(questionNumber < QuestionList.length - 1) {
       questionNumber++;
     }
   }

   String getQuestionTextForCurrentQuestion() {
     return QuestionList[questionNumber].questionText;

   }

   List<String> getAnswers() {
     return QuestionList[questionNumber].answersList;
   }

  List<int> getScoreFromAnswers() {
     return QuestionList[questionNumber].answerWeight;
   }

   String getCorrectAnswer() {
     return QuestionList[questionNumber].correctAnswer;
   }

   bool didFinishQuiz() {
     return questionNumber >= QuestionList.length - 1;
   }

   void reset() {
     questionNumber = 0;

   }

   int getMaxScore()
   {
     return QuestionList.length  * 10;
   }

List<String> getShuffledAnswers()
{
  return QuestionList[questionNumber].getShuffledAnswers();
}


}