import 'package:flutter/material.dart';

class HoleButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  HoleButton(this.buttonText, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(99, 94, 226, 1)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: 50,
      child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style:
                TextStyle(color: Color.fromRGBO(99, 94, 226, 1), fontSize: 24),
          )),
    );
  }
}
