import '/resources/pages/details_item_screen_page.dart';
import '/resources/pages/app_profile_page.dart';
import '/resources/pages/appnotifications_page.dart';
import '/resources/pages/app_search_page.dart';
import '/resources/pages/app_home_screen_page.dart';
import '/resources/pages/app_main_screen_page.dart';
import '/resources/pages/not_found_page.dart';
import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* App Router
|--------------------------------------------------------------------------
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
|
| * [Tip] Add authentication 🔑
| Run the below in the terminal to add authentication to your project.
| "dart run scaffold_ui:main auth"
|
| Learn more https://nylo.dev/docs/6.x/router
|-------------------------------------------------------------------------- */

appRouter() => nyRoutes((router) {
      router.add(HomePage.path).initialRoute();

      // Add your routes here ...

      // router.add(NewPage.path, transition: PageTransitionType.fade);

      // Example using grouped routes
      // router.group(() => {
      //   "route_guards": [AuthRouteGuard()],
      //   "prefix": "/dashboard"
      // }, (router) {
      //
      // });
      router.add(NotFoundPage.path).unknownRoute();
      router.add(AppMainScreenPage.path);
      router.add(AppHomeScreenPage.path);
      router.add(AppSearchPage.path);
      router.add(AppnotificationsPage.path);
      router.add(AppProfilePage.path);
      router.add(DetailsItemScreenPage.path);
    });
