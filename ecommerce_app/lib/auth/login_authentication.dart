import 'package:ecommerce_app/screens/homepage.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  Authentication({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      return HomePage();
    } else {
      return LoginScreen();
    }
  }
}
