import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogUtils {
  static showMessageDialog({
    required BuildContext context,
    required String message,
    required String posTitle,
    required void Function() posClick,
    String? negTitle,
    void Function()? negClick,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(message),
            actions: [
              ElevatedButton(onPressed: posClick, child: Text(posTitle)),
              Visibility(
                visible: negTitle != null,
                child: ElevatedButton(
                  onPressed: negClick,
                  child: Text(negTitle?? " "),
                ),
              ),
            ],
          ),
    );
  }

  static showLodingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) =>
              AlertDialog(title: Center(child: CircularProgressIndicator())),
    );
  }

  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
