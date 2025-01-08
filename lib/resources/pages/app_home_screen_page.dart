import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/app.dart';
import 'package:flutter_app/app/models/f_category.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/resources/pages/category_items_page.dart';
import 'package:flutter_app/resources/pages/details_item_screen_page.dart';
import 'package:flutter_app/resources/widgets/banner_widget.dart';
import 'package:flutter_app/resources/widgets/curated_items_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppHomeScreenPage extends NyStatefulWidget {
  static RouteView path = ("/app-home-screen", (_) => AppHomeScreenPage());

  AppHomeScreenPage({super.key})
      : super(child: () => _AppHomeScreenPageState());
}

class _AppHomeScreenPageState extends NyPage<AppHomeScreenPage> {
  @override
  get init => () {};

  @override
  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    getImageAsset("logo2.png"),
                    height: 40,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Iconsax.shopping_bag,
                        size: 30,
                      ),
                      Positioned(
                        top: -5,
                        right: -3,
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            BannerWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shop by category',
                    style: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: Colors.black45,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ],
              ),
            ),

            // for Category

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  fCategories.length,
                  (index) => InkWell(
                    onTap: () {
                      // filter products based ont he selected category

                      final filterItems = fashioEcomerce
                          .where((item) =>
                              item.category?.contains(Category.values
                                  .firstWhere(
                                      (e) =>
                                          e.name.toLowerCase() ==
                                          fCategories[index]
                                              .name
                                              ?.toLowerCase(),
                                      orElse: () => Category.women)) ??
                              false)
                          .toList();

                      // Navigate to the category page

                      routeTo(
                        CategoryItemsPage.path,
                        data: {
                          'category': fCategories[index].name,
                          'items': filterItems,
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: context.color.fbackgroundColor1,
                            backgroundImage: AssetImage(
                              getImageAsset(fCategories[index].image ?? ""),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(fCategories[index].name ?? "")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current for you',
                    style: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: Colors.black45,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ],
              ),
            ),

            Container(
              height: size.height * 0.7,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: fashioEcomerce.length,
                itemBuilder: (context, index) {
                  final eCommerceItems = fashioEcomerce[index];
                  return InkWell(
                    onTap: () => routeTo(
                      DetailsItemScreenPage.path,
                      data: eCommerceItems,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CuratedItems(
                        eCommerceItems: eCommerceItems,
                        size: size,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
