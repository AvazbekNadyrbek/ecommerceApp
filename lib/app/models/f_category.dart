import 'package:nylo_framework/nylo_framework.dart';

class FCategory extends Model {
  final String? name, image;
  static StorageKey key = "f_category";

  FCategory({
    required this.name,
    required this.image,
  }) : super(key: key);

  // Fix the fromJson constructor
  FCategory.fromJson(dynamic data)
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

List<FCategory> fCategories = [
  FCategory(name: "Women", image: "women.png"),
  FCategory(name: "Men", image: "men.png"),
  FCategory(name: "Teens", image: "teen.png"),
  FCategory(name: "Kids", image: "kids.png"),
  FCategory(name: "Baby", image: "baby.png"),
];

List<String> filteredCategories = [
  "Filter",
  "Size",
  "Ratings",
  "Size",
  "Color",
  "Price",
  "Brand",
];
