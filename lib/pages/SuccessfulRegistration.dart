import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/pages/MainPage.dart';
import 'package:music_app/widgets/GradientButton.dart';
import 'package:music_app/widgets/HoleButton.dart';
import 'package:music_app/pages/Registration.dart';
import 'package:music_app/pages/Login.dart';

class SuccessfulRegistration extends StatelessWidget {
  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(99, 94, 226, 1),
    fontSize: 36,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(top: 64, bottom: 36),
              child: Text(
                'Cheer!',
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'You have successfully registered in the MusicApp! Rather, go to the app',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 37),
                child: Image.asset('assets/itunes.png')),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: GradientButton(
                'Go',
                onPressed: () {
                  Get.to(() => MainPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
