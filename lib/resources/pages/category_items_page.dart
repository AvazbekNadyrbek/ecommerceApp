import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/app.dart';
import 'package:flutter_app/app/models/f_category.dart';
import 'package:flutter_app/app/models/sub_category.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/resources/pages/details_item_screen_page.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CategoryItemsPage extends NyStatefulWidget {
  static RouteView path = ("/category-items", (_) => CategoryItemsPage());

  CategoryItemsPage({super.key})
      : super(child: () => _CategoryItemsPageState());
}

class _CategoryItemsPageState extends NyPage<CategoryItemsPage> {
  late String category;
  late List<AppModel> categoryItems;
  TextEditingController _textEditingController = TextEditingController();

  @override
  get init => () {
        final pageData = data();
        category = pageData['category'];
        // Simpler way to convert list
        categoryItems = List<AppModel>.from(pageData['items']);
      };

  @override
  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => pop(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: NyTextField(
                        controller: _textEditingController,
                        validationRules: "not_empty|postcode_uk",
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          hintText: "$category's Fashion",
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                          filled: true,
                          fillColor: context.color.fbackgroundColor2,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Iconsax.search_normal,
                            color: Colors.black38,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filteredCategories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Row(
                            children: [
                              Text(filteredCategories[index]),
                              SizedBox(width: 5),
                              index == 0
                                  ? Icon(
                                      Icons.filter_list,
                                      size: 15,
                                    )
                                  : Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 15,
                                    )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  subCategories.length,
                  (index) => InkWell(
                    onTap: () {
                      // filter products based ont he selected category
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: context.color.fbackgroundColor2,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: Image.asset(
                                  subCategories[index].image,
                                ).localAsset().image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(subCategories[index].name)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: categoryItems.isEmpty
                  ? Center(
                      child: Text(
                        'No items available in this category',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: categoryItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () => routeTo(
                                DetailsItemScreenPage.path,
                                data: categoryItems[index],
                              ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: categoryItems[index].image,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: context.color.fbackgroundColor2,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            categoryItems[index].image),
                                        fit: BoxFit.cover),
                                  ),
                                  height: 180,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Colors.black26,
                                          child: Icon(Icons.favorite_border,
                                              color: Colors.white, size: 18),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'H&M',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black26),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 17,
                                  ),
                                  Text(
                                    categoryItems[index].rating.toString(),
                                  ),
                                  Text(
                                    '(${categoryItems[index].review.toString()})',
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.5,
                                child: Text(
                                  categoryItems[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$${categoryItems[index].price.toString()}.00',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  if (categoryItems[index].isChecked == true)
                                    Text(
                                      '\$${categoryItems[index].price! + 10}.00',
                                      style: TextStyle(
                                        color: Colors.black26,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.black26,
                                      ),
                                    ),
                                ],
                              )
                            ],
                          )),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
