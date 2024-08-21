import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool password;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String value) onChanged;

  const InputCustom({
    super.key,
    this.label,
    this.hint,
    this.password = false,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.validator,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        hintText: hint,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
