import 'package:authapplication/app/mobile/auth_service.dart';
import 'package:authapplication/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DeleteAccountPage extends StatefulWidget {
  DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPass = TextEditingController();

  String errorMessage = '';
  void onDelete() async {
    try {
      await authService.value.deleteAccount(
        email: controllerEmail.text,
        password: controllerPass.text,
      );
      setState(() {
        errorMessage = '';
      });
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
        child: Column(
          children: [
            Lottie.asset('assets/lotties/TrashBin.json'),
            SizedBox(height: 20.0),
            Text('Delete account', style: KTextStyleTitle.pageTitle),
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
                onDelete();
              },
              child: Text('Delete account'),
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
