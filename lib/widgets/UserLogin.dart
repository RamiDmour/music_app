import 'package:flutter/material.dart';

class UserLogin extends StatelessWidget {

  final String userlogin
  ;

  UserLogin(this.userlogin);

  final TextStyle loginStyle = TextStyle(
    color: Color.fromRGBO(99, 94, 226, 1),
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Text(
        userlogin,
        style: loginStyle,
      ),
    );
  }
}
