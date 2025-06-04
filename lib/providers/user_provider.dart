import 'package:evently/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? myUser;
  SaveUser(User? newUser) {
    myUser = newUser;
    notifyListeners();
  }
}
