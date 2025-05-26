
import 'package:evently/authentication/Reset%20Password/reset_password.dart';
import 'package:evently/authentication/Login/login.dart';
import 'package:evently/authentication/Register/register.dart';
import 'package:evently/ui/home/home.dart';
import 'package:evently/ui/splash/splash_screen.dart';
import 'package:evently/ui/start/screen/start_screen.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String register = '/Register';
  static const String login = '/Login';
  static const String splashScreen = '/splashScreen'; 
  static const String startScreen = '/startScreen';
  static const String resetpassword = '/resetPassword';
  static const String home = '/Home';
  //  static const String splashScreen = '/splashScreen';
 
  static Route? router(RouteSettings settings) {

    switch (settings.name) {
     
      case login:
        return MaterialPageRoute(builder: (context) =>  Login());

      case register:
       return MaterialPageRoute(builder: (context) => const Register());

      case splashScreen:
       return MaterialPageRoute(builder: (context) => const SplashScreen()); 
      
      case startScreen:
       return MaterialPageRoute(builder: (context) =>  StartScreen());

      case resetpassword:
       return MaterialPageRoute(builder: (context) =>  ResetPassword()); 
       case home:
       return MaterialPageRoute(builder: (context) =>  Home()); 
    }
    return null;
  }
}
