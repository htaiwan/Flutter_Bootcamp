import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../constants.dart';
import '../screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  FirebaseAuth _auth;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: "輸入信箱"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: "輸入密碼"),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              buttonTitle: 'Log In',
              buttonColor: Colors.lightBlueAccent,
              onPress: () async {
                try {
                  final loginUser = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (loginUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
