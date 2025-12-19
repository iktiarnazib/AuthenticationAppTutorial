import 'package:authapplication/app/mobile/auth_service.dart';
import 'package:authapplication/pages/change_username.dart';
import 'package:authapplication/pages/delete_account_page.dart';
import 'package:authapplication/pages/reset_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String errorMessage = '';
  void onLogout() async {
    try {
      await authService.value.signOut();
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message ?? 'There has been an error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 300,
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome, ',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      authService.value.currentUser!.displayName ?? 'User',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text('Update Username'),
              trailing: Icon(Icons.forward),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChangeUsername();
                    },
                  ),
                );
                setState(() {});
              },
            ),
            ListTile(
              title: Text('Reset Password'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResetPasswordPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Delete account'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DeleteAccountPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              onTap: () {
                onLogout();
              },
              title: Text('Log out'),
              trailing: Icon(Icons.arrow_forward),
            ),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
