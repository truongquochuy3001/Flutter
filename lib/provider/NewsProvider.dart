import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:project_learning_g1/model/NewsModel.dart';
import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier {
  List<NewsModel> list = [];
  void getList() async {
    String apiURL =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-10-18&sortBy=publishedAt&apiKey=e8d4e4e58afb40f0a350a23804aa2b0d';
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject['articles'] as List;
    list = newsListObject.map((e) {
      return NewsModel.fromJson(e);
    }).toList();

    notifyListeners();
  }
}
