import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchField extends StatelessWidget {
  final String defaultValue;
  final bool secured;
  final TextEditingController controller;
  SearchField({this.defaultValue, this.secured = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
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
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromRGBO(11, 7, 94, 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(99, 94, 226, 1)),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              labelText: defaultValue,
              labelStyle: TextStyle(
                color: Color.fromRGBO(11, 7, 94, 0.6),
                fontSize: 16,
              ))),
    );
  }
}
