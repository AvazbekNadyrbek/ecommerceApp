import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/app.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ItemsDetails extends StatefulWidget {
  final AppModel eCommerceItem;

  const ItemsDetails({super.key, required this.eCommerceItem});

  @override
  createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends NyState<ItemsDetails> {
  @override
  get init => () {};

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text("Details Product"),
          backgroundColor: context.color.fbackgroundColor2,
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
            )
          ]),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
