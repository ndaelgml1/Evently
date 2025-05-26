import 'package:flutter/material.dart';

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
                  onPressed: posClick,
                  child: Text(posTitle),
                ),
              ),
            ],
          ),
    );
  }

  static showLodingDialog(BuildContext context) { 
    showDialog(context: context, builder: (context)=> AlertDialog(
     title: Center(child: CircularProgressIndicator()) ));
    
  }
}
