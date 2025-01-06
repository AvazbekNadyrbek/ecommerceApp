class Product2 {
  List<Product2Value>? value;

  Product2({this.value});

  Product2.fromJson(List<dynamic> json) {
    value = json.map((e) => Product2Value.fromJson(e)).toList();
  }

  List<dynamic>? toJson() {
    return value?.map((e) => e.toJson()).toList();
  }
}

class Product2Value {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? ipAddress;

  Product2Value({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.ipAddress,
  });

  Product2Value.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    email = json['email']?.toString();
    gender = json['gender']?.toString();
    ipAddress = json['ip_address']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'gender': gender,
      'ip_address': ipAddress,
    };
  }
}
