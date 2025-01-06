import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppProfilePage extends NyStatefulWidget {

  static RouteView path = ("/app-profile", (_) => AppProfilePage());
  
  AppProfilePage({super.key}) : super(child: () => _AppProfilePageState());
}

class _AppProfilePageState extends NyPage<AppProfilePage> {

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Profile")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
