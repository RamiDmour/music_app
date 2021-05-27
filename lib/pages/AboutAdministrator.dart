import 'package:flutter/material.dart';
import 'package:music_app/pages/User.dart';
import 'package:get/get.dart';
import 'package:music_app/widgets/BottomNavigation.dart';

class AboutAdministrator extends StatelessWidget {
  final TextStyle headerStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  final TextStyle header2Style = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 22,
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
                      Get.to(() => User());
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 19),
                        child: Text(
                          'title_administrator'.tr,
                          style: headerStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Text(
                'subtitle_admin'.tr,
                style: header2Style,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 17),
                child: Text(
                  'text_admin'.tr,
                  style: textStyle,
                ),
              ),
              SizedBox(
                height: 67,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(NavigationItem.ACCOUNT, context),
    );
  }
}
