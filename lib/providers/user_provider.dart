import 'package:evently/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? myUser;
  void saveUser(User? newUser) {
    myUser = newUser;
    notifyListeners();
  }
}
