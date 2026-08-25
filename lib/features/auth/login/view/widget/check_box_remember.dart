import 'package:flutter/material.dart';

class CheckBoxRemeber extends StatefulWidget {
  const CheckBoxRemeber({super.key});

  @override
  State<CheckBoxRemeber> createState() => _CheckBoxRemeberState();
}

bool isCheck = false;

class _CheckBoxRemeberState extends State<CheckBoxRemeber> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor: const WidgetStatePropertyAll(Color(0xFF3F80FF)),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      value: true,
      onChanged: (value) {
        setState(() {
          isCheck = value!;
        });
      },
    );
  }
}
