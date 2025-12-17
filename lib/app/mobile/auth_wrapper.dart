import 'package:authapplication/app/mobile/auth_service.dart';
import 'package:authapplication/pages/home_page.dart';
import 'package:authapplication/pages/login_page.dart';
import 'package:authapplication/pages/welcome_page.dart';
import 'package:authapplication/widget_tree.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authService.value.authStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          return WidgetTree();
        }
        return LoginPage();
      },
    );
  }
}
