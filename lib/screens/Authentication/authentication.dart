import 'package:demo_flutter_firebase_auth/screens/Authentication/login.dart';
import 'package:demo_flutter_firebase_auth/screens/Authentication/register.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggle = false;
  void toogleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToggle) {
      return Register(toggleScreen: toogleScreen);
    } else {
      return Login(toggleScreen: toogleScreen);
    }
  }
}
