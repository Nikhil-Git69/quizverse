
import 'package:flutter/material.dart';
import 'package:quizverse/ResultScreen.dart';
import 'question_engine.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.UserName});
  final String UserName;

  @override
  State<Quiz> createState() => _QuizState();
}




class _QuizState extends State<Quiz> {

  final QuestionEngine questionEngine = QuestionEngine();



  String currentQuestion = '';
   int score = 0;

  void _Answercontrol(String selectedAnswer) {
    String correctAnswer = questionEngine.getCorrectAnswer();
    bool isCorrect = selectedAnswer == correctAnswer;
    if (isCorrect) {

      score += 10;
      
    }


    //vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    //BEFORE RESULT SCREEN
    // setState(() {
    //   if (!questionEngine.didFinishQuiz()){
    //     questionEngine.nextQuestion();
    //   }
      // else
      //   {
      //     Navigator.pop(context);
      //   }

    // });

    // void Onreset() {
    //   questionEngine.questionNumber = 0;
    //   Navigator.pop(context);
    //
    // }
   //vvvvvvvvvvvvvvvvvvvvvvvvvvvv
    //SKIPSSSS FROM Second LAST QUESTION TO RESULT
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^



    if (!questionEngine.didFinishQuiz()) {
      setState(() {
        questionEngine.nextQuestion();
      });
    } else {

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Resultscreen(UserName: widget.UserName, finalScore: score)));

    }

  }

  @override
  Widget build(BuildContext context) {



    currentQuestion = questionEngine.getQuestionTextForCurrentQuestion();

    List<String> answers = questionEngine.getAnswers();


    return  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white ),
              centerTitle: true,
                title: Text('QuizVerse',
                  style: TextStyle(
                      color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              backgroundColor: Color(0xFF2D4C8C),
            ),
          body: Column(
            children: [


            SizedBox(height: 150,),
            Center(

              child: Text(currentQuestion ,
                style: TextStyle(
                  color: Color(0xFF2D4C8C),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,

              ),),
            ),
            SizedBox(height: 25,),

              ...answers.map((a) {
                return Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: OutlinedButton(

                    onPressed: () => _Answercontrol(a),

                    child: Text(
                      a,
                      style: const TextStyle(
                        color: Color(0xFF2D4C8C),
                        fontSize: 20,

                      ),
                    ),
                  ),
                );
              }
              ),








            ],
          ),


bottomNavigationBar: BottomAppBar(
  color: Colors.white,
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

  children: [

    Text('User: ${widget.UserName}',
    style: TextStyle(
      color: Color(0xFF2D4C8C),
      fontSize: 20,
      fontStyle: FontStyle.italic,

    ),),

    Text('Score: ${score}',
    style: TextStyle(
      color: Color(0xFF2D4C8C),
      fontSize: 20,
      fontStyle: FontStyle.italic,

    ),),



  ],
),


),





        ));
  }
}
