import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/AuthController.dart';
import 'package:music_app/pages/SuccessfulRegistration.dart';
import 'package:music_app/widgets/InputField.dart';
import 'package:music_app/widgets/GradientButton.dart';
import 'package:music_app/widgets/PageWrapper.dart';

class Registration extends StatelessWidget {
  final authController = Get.put(AuthController());

  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 24,
  );
  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    return Obx(
      () => PageWrapper(
        loading: authController.isLoading.value,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Text(
                    'Input your e-mail',
                    style: textStyle,
                    textAlign: TextAlign.left, //??????????
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: InputField(defaultValue: 'yulianka@blabla.by', controller: email,),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Input your password',
                      style: textStyle,
                      textAlign: TextAlign.left, //??????????
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: InputField(
                      defaultValue: '',
                      secured: true,
                      controller: password,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(authController.errorMessage.value, style: TextStyle(fontSize: 16, color: Colors.red)),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: GradientButton(
                        'Sign up',
                        onPressed: () {
                          authController.register(email.text, password.text);
                        },
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
