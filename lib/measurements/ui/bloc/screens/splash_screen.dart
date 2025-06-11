import 'dart:async';
import 'package:balcuisine/auth/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:balcuisine/measurements/ui/bloc/screens/history.dart';
 
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3)); // Garde le splash un peu visible

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Utilisateur connecté → Page des mesures
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MeasurementHistoryScreen()),
      );
    } else {
      // Pas connecté → Page de login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginForm()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_sharp, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "Mesures Electroniques",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
