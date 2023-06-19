// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import '../Screens/getstart_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => getstart()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color.fromARGB(255, 231, 231, 213),
       backgroundColor: Color(0xFFD50000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome To the",
              style: TextStyle(
                  fontFamily: "Cursive",
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Foodie",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cursive"),
            ),
          ],
        ),
      ),
    );
  }
}
