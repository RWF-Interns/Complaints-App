import 'package:flutter/material.dart';
import 'package:LoginApp/utilities/constants.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String text;
  Button({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide.none,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: kSubHeadingText.copyWith(
            fontWeight: FontWeight.w400,
            letterSpacing: 2.5,
          ),
        ),
      ),
      elevation: 3.0,
      fillColor: kButtonColor,
      splashColor: kButtonColor.withOpacity(0.5),
    );
  }
}
