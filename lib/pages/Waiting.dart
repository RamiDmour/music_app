import 'package:flutter/material.dart';

class Waiting extends StatelessWidget {
  final TextStyle headerStyle = TextStyle(
    color: Color.fromRGBO(133, 121, 236, 1),
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: Center(
          child: Text(
            'Loading...',
            style: headerStyle,
          ),
        ),
      ),
    );
  }
}
