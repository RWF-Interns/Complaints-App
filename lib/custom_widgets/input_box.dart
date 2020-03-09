import 'package:flutter/material.dart';
import 'package:LoginApp/utilities/constants.dart';

class InputBox extends StatelessWidget {
  String input;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final keyboardType;

  InputBox(
      {@required this.labelText,
      @required this.hintText,
      this.obscureText,
      @required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextField(
        onChanged: (val) {
          input = val;
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
          focusColor: kButtonColor,
          border: InputBorder.none,
          filled: true,
          fillColor: kButtonColor.withOpacity(0.3),
          contentPadding: EdgeInsets.all(8.0),
          hintText: hintText,
          hintStyle: kText,
          labelText: labelText,
          labelStyle: kSubHeadingText.copyWith(color: Colors.black),
          hoverColor: kButtonColor,
        ),
        cursorColor: kButtonColor,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        style: kHugeText.copyWith(color: Colors.blueAccent, letterSpacing: 6.0),
      ),
    );
  }
}
