import 'package:flutter/material.dart';
import 'package:music_app/pages/Info.dart';
import 'package:music_app/pages/User.dart';
import 'package:music_app/widgets/BottomNavigation.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  final TextStyle headerStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  final TextStyle header2Style = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 24,
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
                      Get.back();
                    },
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'title_settings'.tr,
                    style: headerStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 76,
              ),
              Text(
                'subtitle_settings'.tr,
                style: header2Style,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'about_app'.tr,
                    style: textStyle,
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/to.png'),
                    onPressed: () {
                      Get.to(() => Info());

                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'change_language'.tr,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(NavigationItem.ACCOUNT, context),
    );
  }
}
