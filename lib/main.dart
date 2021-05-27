import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/myApp_translations.dart';
import 'package:music_app/pages/BlankScreen.dart';
import 'package:music_app/pages/GreetUser.dart';
import 'package:music_app/pages/MainPage.dart';

import 'initServices.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      translations: MyAppTranslations(),
      locale: Get.deviceLocale,
      title: 'Music App',
      theme: ThemeData(
        textTheme: GoogleFonts.comfortaaTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home:
          BlankScreen(),
    );
  }
}
