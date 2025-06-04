import 'dart:async';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/routes/routes_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    NavigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(AssetsManager.eventlyLogo),
              const Spacer(),
              Image.asset(AssetsManager.branding),
            ],
          ),
        ),
      ),
    );
  }

  NavigateToNext() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, RoutesManager.home);
      });
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, RoutesManager.startScreen);
      });
    }
  }
}
