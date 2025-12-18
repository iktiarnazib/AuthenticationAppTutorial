import 'package:authapplication/app/mobile/auth_service.dart';
import 'package:authapplication/constants/constants.dart';
import 'package:authapplication/pages/home_page.dart';
import 'package:authapplication/pages/profile_page.dart';
import 'package:authapplication/widgets/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  List<Widget> pageList = [HomePage(), ProfilePage()];

  User? user = authService.value.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Authentication App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              Text('User:'),
              Card(
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(user!.email ?? 'No user'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selected, child) {
          return selected == 0 ? pageList.elementAt(0) : pageList.elementAt(1);
        },
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
