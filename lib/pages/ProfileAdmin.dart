import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/pages/AboutAdministrator.dart';
import 'package:music_app/pages/BaseUsers.dart';
import 'package:music_app/pages/BlankScreen.dart';
import 'package:music_app/pages/Login.dart';
import 'package:music_app/pages/GreetUser.dart';
import 'package:music_app/pages/SearchPage.dart';
import 'package:music_app/pages/Settings.dart';
import 'package:music_app/pages/SongsAdmin.dart';
import 'package:music_app/widgets/GradientButton.dart';
import 'package:music_app/pages/SuccessfulRegistration.dart';
import 'package:music_app/widgets/HoleButton.dart';
import 'package:music_app/widgets/BottomNavigation.dart';
import 'package:music_app/pages/Info.dart';
import 'package:get/get.dart';

class ProfileAdmin extends StatelessWidget {
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
  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  final locales = [
    {'name': 'Russian', 'locale': Locale('ru', 'RU')},
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Espanol', 'locale': Locale('es', 'ES')}
  ];

  showLocaleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Choose your language"),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(locales[index]['name']),
              ),
              onTap: () => updateLocale(locales[index]['locale'], context),
            ),
            separatorBuilder: (context, index) => Divider(
              color: Colors.deepPurple,
              thickness: 1,
            ),
            itemCount: 3,
          ),
        ),
      ),
    );
  }

  updateLocale(Locale locale, BuildContext context) {
    Get.back();
    Get.updateLocale(locale);
  }

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'title_admin_profile'.tr,
                    style: headerStyle,
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
                  Text(
                    FirebaseAuth.instance.currentUser.email,
                    style: loginStyle,
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 32),
                  child: HoleButton('button_admin_exit'.tr, onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.offAll(() => GreetGuest());
                  })),
              SizedBox(
                height: 45,
              ),
              Row(
                children: [
                  Text(
                    'button_admin_change_language'.tr,
                    style: textStyle,
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/to.png'),
                    onPressed: () => showLocaleDialog(context),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'admin_users'.tr,
                    style: textStyle,
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/to.png'),
                    onPressed: () {
                      Get.to(() => BaseUsers());
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'admin_songs'.tr,
                    style: textStyle,
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/to.png'),
                    onPressed: () {
                      Get.to(() => SongsAdmin());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
