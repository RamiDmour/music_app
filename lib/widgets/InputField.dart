import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String defaultValue;
  final bool secured;
  final TextEditingController controller;
  InputField({this.controller, this.defaultValue, this.secured = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextField(
          controller: controller,
          obscureText: secured,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(52, 48, 156, 1),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(99, 94, 226, 1)),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              labelText: defaultValue,
              labelStyle: TextStyle(
                color: Color.fromRGBO(11, 7, 94, 0.6),
              ))),
    );
  }
}
