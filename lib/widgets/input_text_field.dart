import 'package:flutter/material.dart';
import 'package:emart/consts/consts.dart';

class InputTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool? obscureText;
  final Widget? suffix;
  final bool? readOnly;
  final TextEditingController controller;

  const InputTextField(
      {super.key,
      this.readOnly,
      required this.title,
      required this.hintText,
      required this.controller,
      this.obscureText = false,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.text.color(redColor).size(16).fontFamily(semibold).make(),
        5.heightBox,
        TextFormField(
          obscureText: obscureText!,
          controller: controller,
          readOnly: readOnly!,
          decoration: InputDecoration(
            suffix: suffix,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: redColor,
              ),
            ),
          ),
        ),
        7.heightBox,
      ],
    );
  }
}
