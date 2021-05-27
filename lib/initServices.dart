import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/AuthController.dart';
import 'package:music_app/controllers/UsersController.dart';

Future<void> initServices() async {
  await Firebase.initializeApp();
  await Get.putAsync<AuthController>(() => AuthController().init());
}