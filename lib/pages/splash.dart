import 'package:app_chumi/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


void main() => runApp( const Splash());

class Splash extends StatelessWidget {
   const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/cumple-logo.png'),
        nextScreen:const Login(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color.fromARGB(255, 98, 170, 230),
      ),
    );
  }
}
