import 'package:flutter/material.dart';
import 'package:flutter_application_codeft/view/home_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
