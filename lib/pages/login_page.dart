import 'package:authapplication/app/mobile/auth_service.dart';
import 'package:authapplication/constants/constants.dart';
import 'package:authapplication/pages/forgotten_password.dart';
import 'package:authapplication/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  String errorMessage = '';
  void onLogin() async {
    try {
      await authService.value.signIn(
        email: controllerEmail.text,
        password: controllerPass.text,
      );
      selectedPageNotifier.value = 0;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'There is an error';
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
            Lottie.asset(
              'assets/lotties/Login.json',
              repeat: false,
              height: 350,
            ),
            SizedBox(height: 20.0),
            Text('Login', style: KTextStyleTitle.pageTitle),
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
              controller: controllerPass,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
            FilledButton(
              onPressed: () {
                onLogin();
              },
              child: Text('Login'),
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ),
                );
              },
              child: Text('Register'),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ForgottenPassword();
                    },
                  ),
                );
              },
              child: Text('Forgot password'),
            ),
          ],
        ),
      ),
    );
  }
}
