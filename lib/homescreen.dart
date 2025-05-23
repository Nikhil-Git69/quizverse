import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizverse/Quiz.dart';
import 'package:fluttertoast/fluttertoast.dart';


class homescr extends StatefulWidget {
  const homescr({super.key});

  @override
  State<homescr> createState() => _homescrState();
}

class _homescrState extends State<homescr> {
TextEditingController UserNameController = TextEditingController();

 Validation()
{
  if (UserNameController.text.isEmpty){
    Fluttertoast.showToast(msg: "Please Enter Your Username");
    return false;
  }
  else
    {
      Fluttertoast.showToast(msg: "Welcome, ${UserNameController.text}" );
      return true;
    }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.white,
        body: Stack(
          children: [

            Container(
              padding: EdgeInsets.symmetric(vertical: 150),
              child: Image.asset("asts/QuizVerseLogo.png"),
            ),

            Center(
              child: Container(
                  alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 250),
                width: 150,
                child: TextFormField(
                  controller: UserNameController,
                  decoration: InputDecoration(

                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  hintText: 'Username',
                  isDense: false,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),

                ),//byXp

             style: TextStyle(
               fontSize: 15,
               color: Color(0xFF2D4C8C),
             ),
                  inputFormatters: [LengthLimitingTextInputFormatter(16),

                  ],

                ),

              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 70),
              child: OutlinedButton.icon(onPressed: ()
              {
               if  (Validation()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Quiz(UserName: UserNameController.text),
                  ));
              }
              },

                icon: Icon(Icons.arrow_right_alt, size: 30,),

                  label:  Text('Start Quiz',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                      color:Color(0xFF2D4C8C),
                  ),),  //byEr

                  ),




            ),

          ],
        ),

      ),
    );


  }
}
