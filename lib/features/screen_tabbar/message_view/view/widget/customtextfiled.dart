import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({
    this.onchanged,
    this.obscure = false,
    super.key,
    required this.hintText,
  });
  String hintText;
  bool obscure;
  Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      validator: (dats) {
        if (dats!.isEmpty) {
          return 'this filed is empty';
        }
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
