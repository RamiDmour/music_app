import 'package:flutter/material.dart';
import 'package:music_app/pages/Settings.dart';
import 'package:get/get.dart';
import 'package:music_app/widgets/BottomNavigation.dart';

class Info extends StatelessWidget {
  final TextStyle headerStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/back.png'),
                    onPressed: () {
                      Get.to(() => Settings());
                    },
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'about_app'.tr,
                    style: headerStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 92,
              ),
              Image.asset('assets/itunes.png'),
              SizedBox(
                height: 52,
              ),
              Text(
                'subtitle_app'.tr,
                style: textStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '@2020-2021 mUSICaPP',
                style: textStyle,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'text_app'.tr,
                style: TextStyle(
                  color: Color.fromRGBO(11, 7, 94, 1),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(NavigationItem.ACCOUNT, context),
    );
  }
}
