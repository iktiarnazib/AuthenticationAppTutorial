import 'package:authapplication/app/mobile/auth_service.dart';
import 'package:authapplication/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerOldPass = TextEditingController();

  TextEditingController controllerNewPass = TextEditingController();
  String errorMessage = '';

  void onResetPass() async {
    try {
      await authService.value.resetPasswordFromCurrentPassword(
        currentPassword: controllerOldPass.text,
        newPassword: controllerNewPass.text,
        email: controllerEmail.text,
      );
      successDialog();
      setState(() {
        errorMessage = '';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'There has been an error';
      });
    }
  }

  void successDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text('Password Reset Success'),
          content: Text('Your Password reset has been successful!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Lottie.asset('assets/lotties/ChangePassword.json', height: 300),
            SizedBox(height: 20.0),
            Text('Reset Password', style: KTextStyleTitle.pageTitle),
            SizedBox(height: 30.0),
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: controllerOldPass,
              decoration: InputDecoration(
                hintText: 'Old Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: controllerNewPass,
              decoration: InputDecoration(
                hintText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
            FilledButton(
              onPressed: () {
                onResetPass();
              },
              child: Text('Reset Password'),
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
