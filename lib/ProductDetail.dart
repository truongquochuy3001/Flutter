import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_learning_g1/Product.dart';
import 'package:project_learning_g1/model/Product.dart';
import 'CartList.dart' as cart;

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.News});
  final Product News;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product detail"),
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ProductsPage())));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.network(News.image ?? ""),
              SizedBox(
                height: 5,
              ),
              Text(
                News.title ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                News.price.toString() + "USD" ?? "",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                News.description ?? "",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    cart.add(News);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
