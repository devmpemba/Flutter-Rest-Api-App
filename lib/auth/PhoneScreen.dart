import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otp_screen.dart'; // Import the OTPScreen

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {

  //init phone input variable
  final TextEditingController _phoneNumberController = TextEditingController();

  //method to send OTP to device
  Future<void> _verifyPhoneNumber(String phoneNumber) async {

    //init firebase auth
    FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Handle verification completed if needed
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failed
        //print("Failed to Send OTP"),
      },
      codeSent: (String verificationId, int? resendToken) {
        // Navigate to OTPScreen with verificationId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle auto retrieval timeout
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Verification'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Enter Phone Number'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  //get phone number and verify
                  String phoneNumber = _phoneNumberController.text.trim();

                  //validation
                  if (phoneNumber.isNotEmpty) {
                    _verifyPhoneNumber('+255$phoneNumber'); // Replace with your country code
                  }
                },
                child: const Text('Send OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
