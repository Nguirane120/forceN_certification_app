import 'package:flutter/material.dart';

class CommonInput extends StatelessWidget {
  const CommonInput(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.maxLine,
      this.suffixIcon,
      this.readOnly = false});

  final String title;
  final String hint;
  final TextEditingController? controller;
  final int? maxLine;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title),
        TextField(
          readOnly: readOnly,
          maxLength: maxLine,
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: controller,
          decoration: InputDecoration(hintText: hint, suffix: suffixIcon),
        )
      ],
    );
  }
}
