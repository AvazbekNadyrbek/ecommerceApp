import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/app.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DetailsItemScreenPage extends NyStatefulWidget {
  static RouteView path =
      ("/details-item-screen", (_) => DetailsItemScreenPage());

  DetailsItemScreenPage({super.key})
      : super(child: () => _DetailsItemScreenPageState());
}

class _DetailsItemScreenPageState extends NyPage<DetailsItemScreenPage> {
  int currentIndex = 0;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;
  get init => () {};
  late AppModel productInfo = data();
  @override
  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.fbackgroundColor2,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          '${productInfo.name}',
        ),
        actions: [
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
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: context.color.fbackgroundColor2,
            height: size.height * 0.46,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      productInfo.image,
                      height: size.height * 0.4,
                      width: size.width * 0.85,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.only(right: 5),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == currentIndex
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                            )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'H&M',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black26),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 17,
                    ),
                    Text(
                      productInfo.rating.toString(),
                    ),
                    Text(
                      '(${productInfo.review.toString()})',
                      style: TextStyle(color: Colors.black26),
                    ),
                    Spacer(),
                    Icon(
                      Icons.favorite_border,
                    ),
                  ],
                ),
                Text(
                  productInfo.name,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 16, height: 1.5, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '\$${productInfo.price.toString()}.00',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.pink,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (productInfo.isChecked == true)
                      Text(
                        '\$${productInfo.price! + 10}.00',
                        style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black26,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  productInfo.description,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black26,
                      letterSpacing: -0.5),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // for Color
                          Text(
                            'Color',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  productInfo.fcolors.asMap().entries.map((e) {
                                final int index = e.key;
                                final color = e.value;
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: CircleAvatar(
                                      backgroundColor: color,
                                      radius: 18,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedColorIndex =
                                                  index; // update selected color
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color: selectedColorIndex == index
                                                ? Colors.white
                                                : Colors.transparent,
                                          ))),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // for Color
                          Text(
                            'Size',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  productInfo.sizes.asMap().entries.map((e) {
                                final int index = e.key;
                                final Enum size = e.value;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSizeIndex = index;
                                    });
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, top: 10),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selectedSizeIndex == index
                                            ? Colors.black
                                            : Colors.white,
                                        border: Border.all(
                                          color: selectedSizeIndex == index
                                              ? Colors.black
                                              : Colors.black12,
                                        ),
                                      ),
                                      child: Center(
                                          child: Text(
                                        size.name.toUpperCase(),
                                        style: TextStyle(
                                          color: selectedSizeIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ))),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            )
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: _buildButton(
                  title: 'Add to Cart',
                  icon: Iconsax.shopping_bag,
                  isOutlined: true,
                  onTap: () {
                    // Add to cart logic
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildButton(
                  title: 'Buy Now',
                  onTap: () {
                    // Buy now logic
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String title,
    IconData? icon,
    bool isOutlined = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isOutlined ? Colors.white : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: isOutlined ? Colors.black : Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
            ],
            Text(
              title,
              style: TextStyle(
                color: isOutlined ? Colors.black : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
