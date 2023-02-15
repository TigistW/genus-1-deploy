import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color color;
  final VoidCallback? onPressed;
  const Button({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text(text),
      backgroundColor: color,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
