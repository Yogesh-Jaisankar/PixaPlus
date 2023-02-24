import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pixaplus/screens/mainscreen.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            backgroundColor: Colors.black45,
            splash: Image.asset(
              "assets/images/logo.png",
            ),
            duration: 600,
            nextScreen: mainscreen()));
  }
}
