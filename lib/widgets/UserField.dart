import 'package:flutter/material.dart';
class UserField extends StatelessWidget {
  final String email;
  final Function onDelete;

  UserField({this.email, this.onDelete});

  final TextStyle userStyle = TextStyle(
    color: Color.fromRGBO(99, 94, 226, 1),
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            email,
            style: userStyle,
          ),
          MaterialButton(
            height: 25,
            minWidth: 20,
            child: Image.asset('assets/delete.png'),
            onPressed: onDelete ?? () {}),
        ],
      ),
    );
  }
}
