import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/features/home/screen/second_page.dart';
import 'package:task/features/services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: email,
          ),
          ElevatedButton(
              onPressed: () {
                Shared.pref.setString("email", email.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("login"))
        ],
      ),
    );
  }
}
