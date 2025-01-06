import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppnotificationsPage extends NyStatefulWidget {

  static RouteView path = ("/appnotifications", (_) => AppnotificationsPage());
  
  AppnotificationsPage({super.key}) : super(child: () => _AppnotificationsPageState());
}

class _AppnotificationsPageState extends NyPage<AppnotificationsPage> {

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appnotifications")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
