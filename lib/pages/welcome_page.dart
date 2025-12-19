import 'package:authapplication/app/mobile/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void getStarted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('FirstTime', false);

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AuthWrapper();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(height: 100.0),
              Lottie.asset('assets/lotties/Welcome.json'),
              Text(
                'Welcome to our Authentication App',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50.0),
              FilledButton(
                onPressed: () {
                  getStarted();
                },
                child: Text('Get Started'),
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
