import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:project_learning_g1/model/CategoryModel.dart';
import 'package:project_learning_g1/model/NewsModel.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List<Category> list = [];
  Future<void> getList() async {
    String apiURL = "https://fakestoreapi.com/products/categories";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var categoryListObjects = jsonObject as List;
    list = categoryListObjects.map((e) {
      return Category.fromJson(e);
    }).toList();

    notifyListeners();
  }
}
