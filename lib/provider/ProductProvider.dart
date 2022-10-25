import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:project_learning_g1/model/NewsModel.dart';
import 'package:http/http.dart' as http;

import '../model/Product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> list = [];
  Future<void> getList() async {
    String apiURL = "https://fakestoreapi.com/products";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var productListObjects = jsonObject as List;
    list = productListObjects.map((e) {
      return Product.fromJson(e);
    }).toList();

    notifyListeners();
  }

  List<Product> Search(String key) {
    List<Product> list2 = [];

    for (int i = 0; i < list.length; i++) {
      if ((list[i].title.toString().toLowerCase().contains(key.toLowerCase()))
          //     &&
          // (list[i]
          //     .category
          //     .toString()
          //     .toLowerCase()
          //     .contains(key.toLowerCase()))
          ) {
        list2.add(list[i]);
      }
    }
    return list2;
  }

  List<Product> Sort(String key) {
    List<Product> list3 = [];

    for (int i = 0; i < list.length; i++) {
      if ((list[i]
              .category
              .toString()
              .toLowerCase()
              .contains(key.toLowerCase()))
          //     &&
          // (list[i]
          //     .category
          //     .toString()
          //     .toLowerCase()
          //     .contains(key.toLowerCase()))
          ) {
        list3.add(list[i]);
      }
    }
    return list3;
  }

  List<Product> ShoppingCart = [];

  void AddProduct(Product product) {
    ShoppingCart.add(product);
  }

  void DelProduct(String id) {
    ShoppingCart.remove(id);
  }

  List<Product> SearchGenre(String genre) {
    List<Product> ListGenre = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].category.toString().toLowerCase() == genre.toLowerCase()) {
        ListGenre.add(list[i]);
      }
    }
    return ListGenre;
  }
}
