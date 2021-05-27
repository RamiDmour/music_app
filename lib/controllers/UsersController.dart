import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music_app/models/UserModel.dart';
import 'package:music_app/repos/UsersRepo.dart';

class UsersController extends GetxController {
  final loading = false.obs;
  final users = List<UserModel>().obs;

  Future<void> fetchUsers(TextEditingController filterController) async {
    loading.value = true;
    List<UserModel> fetchedUsers = await UsersRepo.getUsers();
    filterController.addListener(() {
      users.assignAll(fetchedUsers.where((user) => user.email.contains(filterController.text)));
    });
    users.assignAll(fetchedUsers);
    loading.value = false;
  }

  Future<void> deleteUser(UserModel user) async {
    await UsersRepo.deleteUser(user);
    users.remove(user);
  }
}