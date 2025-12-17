import 'package:authapplication/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              Lottie.asset('assets/lotties/Home.json'),
              SizedBox(height: 20.0),
              Text('Authenticated', style: KTextStyleTitle.pageTitle),
              Text(
                'Home page is under development',
                style: TextStyle(color: Colors.blue, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
