import 'package:flutter/rendering.dart';

import "dart:core";

class Category {
  String? category;
  Category({this.category});
  factory Category.fromJson(String obj) {
    return Category(
      category: obj,
    );
  }
}
