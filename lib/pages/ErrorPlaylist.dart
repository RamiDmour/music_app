import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/pages/MainPage.dart';
import 'package:music_app/widgets/GradientButton.dart';

class ErrorPlaylist extends StatelessWidget {
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
          'title_error'.tr,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
            Text(
              'text_error'.tr,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: GradientButton(
                'button_error'.tr,
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
