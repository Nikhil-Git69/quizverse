import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:quizverse/homescreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {


@override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=> homescr()));
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [


          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 200),
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset("asts/XperCraftsSplash.png"),
              ),
            ),
            
            
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text('© 2025 XperCrafts. All rights reserved.',
            style: TextStyle(
              color: Colors.white,
            ),),
          )
          

        ],
      ),
    );
  }
}
