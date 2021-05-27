import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/AuthController.dart';
import 'package:music_app/pages/GreetUser.dart';

import 'MainPage.dart';
import 'ProfileAdmin.dart';

class BlankScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var authController = Get.find<AuthController>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if(FirebaseAuth.instance.currentUser == null)
        Get.offAll(() => GreetGuest());
      else if (authController.currentUser.role == "ADMIN")
        Get.offAll(() => ProfileAdmin());
      else
        Get.offAll(() => MainPage());
    });

    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
