import 'dart:core';

class Product {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image});
  factory Product.fromJson(Map<String, dynamic> obj) {
    return Product(
      id: obj['id'],
      title: obj['title'],
      price: obj['price'],
      description: obj['description'],
      category: obj['category'],
      image: obj['image'],
    );
  }
}
