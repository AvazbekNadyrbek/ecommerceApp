import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppSearchPage extends NyStatefulWidget {

  static RouteView path = ("/app-search", (_) => AppSearchPage());
  
  AppSearchPage({super.key}) : super(child: () => _AppSearchPageState());
}

class _AppSearchPageState extends NyPage<AppSearchPage> {

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Search")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
