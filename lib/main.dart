import 'package:flutter/material.dart';
import 'package:project_learning_g1/Login.dart';
import 'package:project_learning_g1/Product.dart';
import 'package:project_learning_g1/Special.dart';

import 'package:project_learning_g1/food_page.dart';
import 'package:project_learning_g1/genre.dart';
import 'package:project_learning_g1/news_page.dart';
import 'package:project_learning_g1/provider/CategoryProvider.dart';
import 'package:project_learning_g1/provider/NewsProvider.dart';
import 'package:project_learning_g1/provider/ProductProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
    ],
    child: MaterialApp(
      home: ProductsPage(),
    ),
  ));
}
