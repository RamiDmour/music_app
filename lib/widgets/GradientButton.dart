import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  GradientButton(this.buttonText, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(168, 219, 250, 1),
            Color.fromRGBO(99, 94, 226, 0.9),
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
