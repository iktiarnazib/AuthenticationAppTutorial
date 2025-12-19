import 'package:authapplication/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({super.key});

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
              decoration: InputDecoration(
                hintText: 'Account Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),

            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'A password reset email has been sent to your account.',
                      style: TextStyle(color: Colors.white),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.pink,
                    duration: Duration(seconds: 2),
                  ),
                );
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
