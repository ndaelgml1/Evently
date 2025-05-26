import 'dart:async';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/routes/routes_manager.dart';
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
    Timer(const Duration(seconds: 3), () { 
      Navigator.pushReplacementNamed(context, RoutesManager.startScreen );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(AssetsManager.eventlyLogo),
            const Spacer(),
            Image.asset(AssetsManager.branding),
          ],
        ),
      ),
    );
  }
}
