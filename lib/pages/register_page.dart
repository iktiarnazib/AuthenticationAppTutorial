import 'package:authapplication/app/mobile/auth_service.dart';
import 'package:authapplication/constants/constants.dart';
import 'package:authapplication/pages/forgotten_password.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPass = TextEditingController();
  String errorMessage = '';
  void onRegister() async {
    try {
      await authService.value.createAccount(
        email: controllerEmail.text,
        password: controllerPass.text,
      );
      selectedPageNotifier.value = 0;
      Navigator.pop(context);
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
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40.0),
              Lottie.asset('assets/lotties/register.json'),
              SizedBox(height: 20.0),
              Text('Register', style: KTextStyleTitle.pageTitle),
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
                  onRegister();
                },
                child: Text('Register'),
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                ),
              ),

              SizedBox(height: 10.0),
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
      ),
    );
  }
}
