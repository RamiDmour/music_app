import 'package:flutter/material.dart';

enum SizeButton {
  BIG,
  SMALL,
}

class ButtonMainPage1 extends StatelessWidget {
  SizeButton currentSize;
  final String buttonText;
  final Function onPressed;
  final Color color;

  ButtonMainPage1(this.currentSize,this.buttonText, {this.onPressed, this.color = const Color.fromRGBO(168, 219, 250, 1)});

  @override
  Widget build(BuildContext context) {
    switch(currentSize){
      case SizeButton.BIG:
        return Container(
          width: 202,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: color,
          ),
          height: 202,
          child: MaterialButton(
            onPressed: onPressed,
            //color: Color.fromRGBO(168, 219, 250, 1),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: Color.fromRGBO(11, 7, 94, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
        break;
      case SizeButton.SMALL:
        return Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: color,
          ),
          height: 98,
          child: MaterialButton(
            onPressed: onPressed,
            //color: Color.fromRGBO(168, 219, 250, 1),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: Color.fromRGBO(11, 7, 94, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
    }

  }
}
