import 'package:demo_flutter_firebase_auth/screens/Authentication/authentication.dart';
import 'package:demo_flutter_firebase_auth/screens/Authentication/login.dart';
import 'package:demo_flutter_firebase_auth/screens/homeScreens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      return const HomeScreen();
    } else {
      return const Authentication();
    }
  }
}
