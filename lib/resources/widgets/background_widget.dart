import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: Stack(children: [

        ]
      ));
  }
}

class CoffeeBean extends StatelessWidget {
  final double? top, left, right, bottom, degree;

  const CoffeeBean({
    required this.top,
    required this.left,
    required this.right,
    required this.bottom,
    required this.degree,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Transform.rotate(
        angle: degree! * pi / 180,
        child: Image.asset('assets/images/bean.png'),
      ),
      top: top,
      left: left,
      right: right,
      bottom: bottom,
    );
  }
}
