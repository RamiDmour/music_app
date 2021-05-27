import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/pages/AboutAdministrator.dart';
import 'package:music_app/pages/GreetUser.dart';
import 'package:music_app/pages/Settings.dart';
import 'package:music_app/widgets/GradientButton.dart';
import 'package:music_app/widgets/HoleButton.dart';
import 'package:music_app/widgets/BottomNavigation.dart';
import 'package:music_app/widgets/UserLogin.dart';

class User extends StatelessWidget {
  final TextStyle loginStyle = TextStyle(
    color: Color.fromRGBO(99, 94, 226, 1),
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  final TextStyle headerStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 23,
              ),
              Row(
                // вместо текста вставить кнопки с иконками(картинками)
                children: [
                  Text(
                    'title_user_profile'.tr,
                    style: headerStyle,
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/settings.png'),
                    onPressed: () {
                      Get.to(() => Settings());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                  // линия
                  decoration: BoxDecoration(
                      //borderRadius: BorderRadius.all(Radius.circular(2)),
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(99, 94, 226, 1),
                    Color.fromRGBO(168, 219, 250, 1),
                  ])),
                  height: 2),
              SizedBox(
                height: 59,
              ),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // почему не ставится посередине
                children: [
                  Image.asset('assets/profil.png'),
                  SizedBox(
                    height: 15,
                  ),
                  UserLogin(FirebaseAuth.instance.currentUser.email),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 123),
                  child: GradientButton(
                    'admins_title'
                        .tr, // изменить нажатие на кнопку администраторы
                    onPressed: () {
                      Get.to(() => AboutAdministrator());
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(top: 32),
                  child: HoleButton(
                    'exit_user_button'.tr,
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Get.offAll(() => GreetGuest());
                    },
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(NavigationItem.ACCOUNT, context),
    );
  }
}
