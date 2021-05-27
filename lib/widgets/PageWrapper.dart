import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  final bool loading;

  PageWrapper({@required this.child, this.loading = false});

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: Color.fromRGBO(99, 94, 226, 1),
          ),
        ),
      );
    } else
      return child;
  }
}
