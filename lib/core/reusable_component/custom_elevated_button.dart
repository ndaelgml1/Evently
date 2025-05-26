import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.title ,required this.onClick});
  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: onClick,
        child: Text(title, style: Theme.of(context).textTheme.labelMedium));
  }
}
