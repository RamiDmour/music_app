import 'package:flutter/material.dart';

class GradientButtonBlocked extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  GradientButtonBlocked(this.buttonText, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(168, 219, 250, 0.5),
            Color.fromRGBO(99, 94, 226, 0.4),
          ])),
      height: 50,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
