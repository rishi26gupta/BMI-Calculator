import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
    @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override 
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),() { 
      Navigator.pushReplacement(context,
       MaterialPageRoute(
        builder: (context)=> MyHomePage(title: 'BMI Calculator'),
      )
      );
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
                 Color(0xff88d3ce),
                 Color(0xff6e45e2),
          ]),
        ),
        child: Center(child: Text('BMI Calculator', style: TextStyle( 
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: Colors.white),
          )
          ),
      ),
    );
  }}
