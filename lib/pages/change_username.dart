import 'package:authapplication/app/mobile/auth_service.dart';
import 'package:authapplication/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChangeUsername extends StatefulWidget {
  const ChangeUsername({super.key});

  @override
  State<ChangeUsername> createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  TextEditingController controllerUsername = TextEditingController();
  String errorMessage = '';
  void updateUsername() async {
    try {
      await authService.value.updateUsername(username: controllerUsername.text);
      Navigator.pop(context);
      errorMessage = '';
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message ?? 'There is an error';
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
            Lottie.asset('assets/lotties/Username.json', repeat: false),
            SizedBox(height: 20.0),
            Text('Login', style: KTextStyleTitle.pageTitle),
            SizedBox(height: 30.0),
            TextField(
              controller: controllerUsername,
              decoration: InputDecoration(
                hintText: 'New Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
            FilledButton(
              onPressed: () {
                updateUsername();
              },
              child: Text('Change Username'),
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
