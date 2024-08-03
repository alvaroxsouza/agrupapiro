import 'package:flutter/material.dart';

class InputCustom extends StatefulWidget {
  final String? label;
  final String? hint;
  final bool password;
  final TextInputType keyboardType;
  final Null Function(dynamic value) onChanged;

  const InputCustom({
    Key? key,
    this.label,
    this.hint,
    this.password = false,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.password,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.label,
        hintText: widget.hint,
      ),
      onChanged: widget.onChanged,
    );
  }
}
