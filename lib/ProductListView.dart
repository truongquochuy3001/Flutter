import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            child: Row(
              children: [
                TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: "Enter a search term",
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.swap_horizontal_circle))
              ],
            ),
          )
        ],
      )),
    );
  }
}
