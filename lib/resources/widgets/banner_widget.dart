import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:nylo_framework/nylo_framework.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.23,
        width: size.width,
        color: context.color.bannerColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 27),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'NEW COLLECTION',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: -1.5,
                      fontWeight: FontWeight.bold,
                      height: 0.6,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '20',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          height: 0,
                          letterSpacing: -3,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '%',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'OFF',
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: -1.5,
                              fontWeight: FontWeight.bold,
                              height: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.black,
                    child: Text(
                      'SHOP NOW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  getImageAsset('girls.png'),
                  height: size.height * 0.19,
                ),
              ),
            ],
          ),
        ));
  }
}
