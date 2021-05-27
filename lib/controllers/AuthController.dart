import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_app/models/UserModel.dart';
import 'package:music_app/pages/MainPage.dart';
import 'package:music_app/pages/ProfileAdmin.dart';
import 'package:music_app/pages/SuccessfulRegistration.dart';
import 'package:music_app/repos/UsersRepo.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = "".obs;
  UserModel currentUser;

  Future<AuthController> init() async {
    if(FirebaseAuth.instance.currentUser != null)
      currentUser = await UsersRepo.getUser(FirebaseAuth.instance.currentUser.email);

    return this;
  }

  register(String email, String password) async {
    if (email.isBlank || password.isBlank) {
      errorMessage.value = "Please, input all fields";
      return;
    }
    isLoading.value = true;
    try {
      await UsersRepo.registerAndSignIn(email, password);

      Get.offAll(() => SuccessfulRegistration());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password')
        errorMessage.value = "Weak password";
      else if (e.code == 'email-already-in-use')
        errorMessage.value =
            "The email address is already in use by another account.";
      else
        errorMessage.value = e.message;
    }
    isLoading.value = false;

  }

  login(String email, String password) async {
    if (email.isBlank || password.isBlank) {
      errorMessage.value = "Please, input all fields";
      return;
    }
    isLoading.value = true;
    try {
      UserModel user = await UsersRepo.getUser(email);
      if (user != null) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (user.role == "ADMIN")
          Get.offAll(() => ProfileAdmin());
        else
          Get.offAll(() => MainPage());
      } else {
        errorMessage.value = "User is not exist";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password')
        errorMessage.value = "Weak password";
      else if (e.code == 'email-already-in-use')
        errorMessage.value =
            "The email address is already in use by another account.";
      else
        errorMessage.value = e.message;
    }
    isLoading.value = false;
  }
}
