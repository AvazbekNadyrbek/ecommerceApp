import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/app_home_screen_page.dart';
import 'package:flutter_app/resources/pages/app_profile_page.dart';
import 'package:flutter_app/resources/pages/app_search_page.dart';
import 'package:flutter_app/resources/pages/appnotifications_page.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppMainScreenPage extends NyStatefulWidget {
  static RouteView path = ("/app-main-screen", (_) => AppMainScreenPage());

  AppMainScreenPage({super.key})
      : super(child: () => _AppMainScreenPageState());
}

class _AppMainScreenPageState extends NyPage<AppMainScreenPage> {
  int selectedIndex = 0;
  final List pages = [
    AppHomeScreenPage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  @override
  get init => () {};

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.black,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          switch (index) {
            case 0:
              routeTo(AppHomeScreenPage.path);
              break;
            case 1:
              routeTo(AppSearchPage.path);
              break;
            case 2:
              routeTo(AppnotificationsPage.path);
              break;
            case 3:
              routeTo(AppProfilePage.path);
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.search_normal,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.notification,
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
