import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

enum Sizes {
  s,
  m,
  l,
  xl,
}

enum Category {
  women,
  men,
  teens,
  kids,
  baby,
  accessories,
}

class AppModel extends Model {
  final String name, image, description;
  final double? rating;
  final int? review, price;
  List<Category>? category;
  List<Color> fcolors = [];
  List<Sizes> sizes;
  bool? isChecked;

  static StorageKey key = "app";

  AppModel({
    required this.name,
    required this.image,
    required this.description,
    required this.category,
    required this.rating,
    required this.review,
    required this.price,
    required this.fcolors,
    required this.sizes,
    this.isChecked = false,
  }) : super(key: key);

  AppModel.fromJson(data, this.name, this.image, this.description,
      this.category, this.rating, this.review, this.price, this.sizes) {}

  @override
  toJson() {
    return {};
  }
}

List<AppModel> fashioEcomerce = [
  // id: 1

  AppModel(
    name: 'Oversized Fit Printed Mesh T-Shirt',
    image: getImageAsset('category_image/image22.png'),
    rating: 4.9,
    review: 120,
    price: 99,
    category: [
      Category.women,
    ],
    isChecked: true,
    description:
        'Lorem is simply dummy text of the printing and typesetting industry.',
    sizes: [Sizes.s, Sizes.m, Sizes.l, Sizes.xl],
    fcolors: [
      Colors.black,
      Colors.blue,
      Colors.blue[100]!,
    ],
  ),

  // id: 2

  AppModel(
    name: 'Printed Sweatshirt',
    image: getImageAsset('category_image/image23.png'),
    rating: 4.8,
    review: 130,
    price: 199,
    category: [
      Category.men,
      Category.teens,
    ],
    isChecked: false,
    description:
        'Lorem is simply dummy text of the printing and typesetting industry.',
    sizes: [Sizes.s, Sizes.m, Sizes.l, Sizes.xl],
    fcolors: [
      Colors.blue,
      Colors.red,
      Colors.purple,
    ],
  ),

  // id: 3

  AppModel(
    name: 'Printed T-Shirt',
    image: getImageAsset('category_image/image24.png'),
    rating: 4.8,
    review: 230,
    price: 19,
    category: [
      Category.men,
      Category.teens,
    ],
    isChecked: false,
    description:
        'Lorem is simply dummy text of the printing and typesetting industry.',
    sizes: [Sizes.s, Sizes.m, Sizes.l, Sizes.xl],
    fcolors: [
      Colors.blue,
      Colors.red,
      Colors.purple,
    ],
  ),

  // id: 4

  AppModel(
    name: 'Printed Sweatshirt',
    image: getImageAsset('category_image/image25.png'),
    rating: 3.8,
    review: 30,
    price: 19,
    category: [
      Category.teens,
      Category.kids,
    ],
    isChecked: true,
    description:
        'Lorem is simply dummy text of the printing and typesetting industry.',
    sizes: [Sizes.s, Sizes.m, Sizes.l, Sizes.xl],
    fcolors: [
      Colors.blue,
      Colors.red,
      Colors.purple,
    ],
  ),

  // id: 4

  AppModel(
    name: 'Baby Frock',
    image: getImageAsset('category_image/image26.png'),
    rating: 3.8,
    review: 30,
    price: 19,
    category: [
      Category.kids,
    ],
    isChecked: true,
    description:
        'Lorem is simply dummy text of the printing and typesetting industry.',
    sizes: [Sizes.s, Sizes.m, Sizes.l],
    fcolors: [
      Colors.blue,
      Colors.red,
      Colors.purple,
    ],
  ),
];
