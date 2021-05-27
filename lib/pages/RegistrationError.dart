import 'package:flutter/material.dart';
import 'package:music_app/widgets/InputField.dart';
import 'package:music_app/widgets/GradientButton.dart';

class RegistrationError extends StatelessWidget {
  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 24,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Input your e-mail',
                  style: textStyle,
                  textAlign: TextAlign.left, //??????????
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: InputField(defaultValue: 'yulianka@blabla.by'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Oops! this e-mail is already occupied(',
                style: TextStyle(
                    color: Color.fromRGBO(246, 11, 11, 0.68), fontSize: 18),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Input your password',
                  style: textStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: InputField(
                  defaultValue: '1234567890',
                  secured: true,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child:
                    GradientButton('Sign up', onPressed: () => print('Privet')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
