import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Here i write in initstate that in which page i want to go from this page
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LinearProgressIndicator(
        color: Colors.black,
        minHeight: 15,
      )),
    );
  }
}
