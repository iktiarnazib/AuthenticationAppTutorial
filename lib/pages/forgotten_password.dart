import 'package:authapplication/app/mobile/auth_service.dart';
import 'package:authapplication/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  TextEditingController controllerEmail = TextEditingController();

  String errorMessage = '';

  void onForgotPass() async {
    try {
      await authService.value.resetPassword(email: controllerEmail.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Your password reset mail has been sent to your email'),
        ),
      );
      setState(() {
        errorMessage = '';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'There has been an error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Lottie.asset('assets/lotties/ForgotPassword.json', repeat: false),
            SizedBox(height: 20.0),
            Text('Reset Password', style: KTextStyleTitle.pageTitle),
            SizedBox(height: 30.0),
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                hintText: 'Account Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Text(errorMessage, style: TextStyle(color: Colors.red)),

            FilledButton(
              onPressed: () {
                onForgotPass();
              },
              child: Text('Send email'),
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
