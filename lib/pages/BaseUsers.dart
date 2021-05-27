import 'package:flutter/material.dart';
import 'package:music_app/controllers/UsersController.dart';
import 'package:music_app/models/UserModel.dart';
import 'package:music_app/pages/ProfileAdmin.dart';
import 'package:music_app/widgets/SearchField.dart';
import 'package:music_app/widgets/UserField.dart';
import 'package:get/get.dart';

class BaseUsers extends StatelessWidget {
  final TextStyle headerStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usersController = Get.put(UsersController());

    usersController.fetchUsers(searchController);

    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/back.png'),
                    onPressed: () {
                      Get.to(() => ProfileAdmin());
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 19),
                        child: Text(
                          'admin_users'.tr,
                          style: headerStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: SearchField(
                  defaultValue: 'field_users'.tr,
                  secured: false,
                  controller: searchController,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Obx(() {
                if (usersController.loading.value)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                var users = usersController.users;

                if (users.length > 0)
                  return ListView.builder(
                    itemCount: usersController.users.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      UserModel user = users[index];
                      if (user.role == "ADMIN")
                        return SizedBox();
                      else
                        return UserField(
                            email: user.email,
                            onDelete: () => usersController.deleteUser(user));
                    },
                  );

                return Center(
                  child: Text("Users not found"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
