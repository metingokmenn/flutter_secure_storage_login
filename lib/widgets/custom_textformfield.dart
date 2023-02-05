import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String type;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.type,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty || value.length < 3) {
          return 'Invalid password';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.name,
      obscureText: widget.type == 'Password' ? true : false,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: widget.type,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
