import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testdemo/splash_screen.dart';
//import firebase auth


class OTPScreen extends StatefulWidget {

  final String verificationId;

  OTPScreen(this.verificationId);

  //const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  String otp = "";

  String verificationId = ""; // Received verification ID from the previous screen

  void _verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Successful OTP verification, navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()), // Replace with your desired screen
      );
    } catch (e) {
      // Handle incorrect OTP
      print("Incorrect OTP");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  otp = value;
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
