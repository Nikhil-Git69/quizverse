import 'dart:math';

import 'package:flutter/material.dart';
import 'question_engine.dart';



class Resultscreen extends StatefulWidget {

  final String UserName;
  final int finalScore;
  const Resultscreen({super.key, required this.UserName, required this.finalScore});



  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {

  QuestionEngine questionEngine = QuestionEngine();



  void onReturn()
  {

    Navigator.popUntil(context, (route) => route.isFirst);
  }



  @override
  Widget build(BuildContext context) {

    int MaxScore = questionEngine.getMaxScore();

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF2D4C8C),
            centerTitle: true,
            title: Text('Quiz Result',
            style: TextStyle(
            color: Colors.white,
            ),),

          ),

          body: Column(
            children: [
              SizedBox(height: 75,),
              Center(child: Text("QUIZ FINISHED!!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xFF2D4C8C),


              ))),
              SizedBox(height: 50,),

          Text("Dear ${widget.UserName}, ",

          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xFF2D4C8C),


          )),
              SizedBox(height: 10,),

              Text(  "Your Score is ${widget.finalScore} / ${MaxScore}",

          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xFF2D4C8C),


          )),


              SizedBox(height: 75,),


              ElevatedButton(onPressed: (){

               onReturn();
              },

                  child: Text("Restart",

                  style: TextStyle(
                    color: Color(0xFF2D4C8C),
                    fontSize: 25,

                  ),
                  ),
              ),



            ],



          ),




        ));
  }
}
