import 'package:authapplication/pages/login_page.dart';
import 'package:authapplication/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                        return LoginPage();
                      },
                    ),
                  );
                },
                child: Text('Login'),
                style: OutlinedButton.styleFrom(
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
