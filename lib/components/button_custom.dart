import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  Color color;
  Color colorText;
  final String? label;
  final VoidCallback onPressed;

  ButtonCustom({super.key, 
    required this.label,
    required this.onPressed,
    required this.color,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(150, 50),
      ),
      child: Text(
        label!,
        style: TextStyle(
          color: colorText,
        ),
      ),
    );
  }
}
