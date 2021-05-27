import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/pages/MainPage.dart';
import 'package:music_app/pages/SearchPage.dart';
import 'package:music_app/pages/User.dart';

enum NavigationItem {
  MAIN,
  SEARCH,
  ACCOUNT,
}

Widget BottomNavigation(NavigationItem currentNav, BuildContext context) =>
    BottomNavigationBar(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      onTap: (value) {
        switch (value) {
          case 0:
            Get.to(() => MainPage());
            break;
          case 1:
            Get.to(() => SearchPage());
            break;
          case 2:
            Get.to(() => User());
        }
      },
      currentIndex: currentNav.index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
            color: Color.fromRGBO(40, 36, 138, 1),
          ),
          label: 'main_navigation_title'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Color.fromRGBO(40, 36, 138, 1),
          ),
          label: 'search_navigation_title'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.assignment_ind,
            size: 30,
            color: Color.fromRGBO(40, 36, 138, 1),
          ),
          label: 'account_navigation_title'.tr,
        )
      ],
    );
