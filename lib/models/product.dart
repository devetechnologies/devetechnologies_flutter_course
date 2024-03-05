import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int? id;
  String? name;
  String? description;
  int? price;
  String? image;
  int? gender;
  int? stateProduct;
  int? categoryProduct;
  int? size;
  bool? state;
  int? categoryPostType;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.gender,
    this.stateProduct,
    this.categoryProduct,
    this.size,
    this.state,
    this.categoryPostType,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        gender: json["gender"],
        stateProduct: json["state_product"],
        categoryProduct: json["category_product"],
        size: json["size"],
        state: json["state"],
        categoryPostType: json["category_post_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "gender": gender,
        "state_product": stateProduct,
        "category_product": categoryProduct,
        "size": size,
        "state": state,
        "category_post_type": categoryPostType,
      };
}
