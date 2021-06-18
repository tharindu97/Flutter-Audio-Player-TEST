import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final Function() onPressed;
  final Icon icon;
  final String label;
  CustomBtn({required this.onPressed, required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label),
    );
  }
}
