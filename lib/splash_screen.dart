import 'package:flutter/material.dart';
import 'package:testdemo/auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          // Navigate back to first route when tapped.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );

        },
        child: const Text('Get Started'),
      ),
    ),
    );

  }
}


