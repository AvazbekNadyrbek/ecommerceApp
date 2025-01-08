import 'package:nylo_framework/nylo_framework.dart';

class SubCategory extends Model {
  final String name;
  final String image;
  static StorageKey key = "sub_category";

  SubCategory({required this.name, required this.image}) : super(key: key);

  SubCategory.fromJson(dynamic data)
      : name = data['name'],
        image = data['image'],
        super(key: key);

  @override
  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}

List<SubCategory> subCategories = [
  SubCategory(name: "Bags", image: "category_image/sub_category/image1.png"),
  SubCategory(name: "Wallet", image: "category_image/sub_category/image2.png"),
  SubCategory(
      name: "Footwear", image: "category_image/sub_category/image3.png"),
  SubCategory(
      name: "Clothers", image: "category_image/sub_category/image4.png"),
  SubCategory(name: "Watches", image: "category_image/sub_category/image5.png"),
  SubCategory(name: "Makepp", image: "category_image/sub_category/image6.png"),
];
