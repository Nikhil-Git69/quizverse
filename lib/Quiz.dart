
import 'package:flutter/material.dart';
import 'package:quizverse/ResultScreen.dart';
import 'question_engine.dart';
import 'package:quizverse/Question.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.UserName});
  final String UserName;

  @override
  State<Quiz> createState() => _QuizState();
}




class _QuizState extends State<Quiz> {

  final QuestionEngine questionEngine = QuestionEngine();



  late List<String> shuffledAnswers;

  @override
  void initState() {
    super.initState();
    shuffledAnswers = questionEngine.getShuffledAnswers();

  }


  String currentQuestion = '';
   int score = 0;

  void _Answercontrol(String selectedAnswer) {
    String correctAnswer = questionEngine.getCorrectAnswer();
    bool isCorrect = selectedAnswer == correctAnswer;
    if (isCorrect) {

      score += 10;
      
    }



    if (!questionEngine.didFinishQuiz()) {
      setState(() {
        questionEngine.nextQuestion();
        shuffledAnswers = questionEngine.getShuffledAnswers();
      });
    } else {

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Resultscreen(UserName: widget.UserName, finalScore: score)));

    }

  }

  @override
  Widget build(BuildContext context) {



    currentQuestion = questionEngine.getQuestionTextForCurrentQuestion();

    List<String> answers = shuffledAnswers;




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

              child: Container(

                height: 75,
                child: Text(currentQuestion ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2D4C8C),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,

                ),),
              ),
            ),
            SizedBox(height: 0,),

              ...answers.map((a) {
                return Padding(

                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: OutlinedButton(

                    onPressed: () => _Answercontrol(a),

                    child: Container(

                      width: double.infinity,
                      child: Text(
                        a,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF2D4C8C),
                          fontSize: 20,

                        ),
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
