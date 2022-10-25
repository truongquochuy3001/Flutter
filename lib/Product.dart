import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_learning_g1/ProductDetail.dart';
import 'package:project_learning_g1/ProductListView.dart';
import 'package:project_learning_g1/ShoppingCart.dart';

import 'package:project_learning_g1/provider/ProductProvider.dart';
import 'package:provider/provider.dart';
import 'CartList.dart' as cart;
import 'provider/CategoryProvider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

String genreSelected = "";
String a = "all";

class _ProductsPageState extends State<ProductsPage> {
  var isloading = true;
  List list = [];
  List list1 = [];
  bool isview = true;
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    if (isloading) {
      (() async {
        await productProvider.getList();
        list = productProvider.list;
        await categoryProvider.getList();
        // list1 = categoryProvider.list;
        setState(() {
          isloading = false;
        });
      })();
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          isview
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isview = false;
                    });
                  },
                  icon: Icon(Icons.grid_view_outlined))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isview = true;
                    });
                  },
                  icon: Icon(Icons.list_alt_outlined))
        ],
        title: Text("Products"),
        backgroundColor: Colors.black,
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              list = productProvider.Search(value);
                            });
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: 'Enter a search term',
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (() {
                                setState(() {
                                  genreSelected = a;
                                  list = productProvider.list;
                                });
                              }),
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: (genreSelected == a
                                      ? Colors.grey
                                      : Colors.white),
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  a,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            ...categoryProvider.list.map((e) => InkWell(
                                  onTap: (() {
                                    setState(() {
                                      genreSelected = e.category.toString();
                                      list =
                                          productProvider.Sort(genreSelected);
                                    });
                                  }),
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: (genreSelected ==
                                              e.category.toString()
                                          ? Colors.grey
                                          : Colors.white),
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      e.category.toString(),
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                          child: isview
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 200,
                                  ),
                                  itemCount: list.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                        color: Colors.white,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetail(
                                                          News: list[index]),
                                                ));
                                          },
                                          child: Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  Image.network(
                                                    list[index]
                                                        .image
                                                        .toString(),
                                                    width: 70,
                                                    height: 70,
                                                  ),
                                                  Text(
                                                    list[index]
                                                        .title
                                                        .toString(),
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Text(
                                                    list[index]
                                                            .price
                                                            .toString() +
                                                        " USD",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          cart.add(list[index]);
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .shopping_cart_checkout_outlined,
                                                      )))
                                            ],
                                          ),
                                        ));
                                  })
                              : ListView(
                                  children: [
                                    ...list.map((e) {
                                      return Container(
                                        width: double.infinity,
                                        height: 100,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 4,
                                                  spreadRadius: 2,
                                                  offset: Offset(4, 1))
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            children: [
                                              Image.network(
                                                e.image.toString(),
                                                width: 70,
                                              ),
                                              Container(
                                                width: 190,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, left: 15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(e.title.toString(),
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(
                                                        e.category
                                                            .toString()
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        e.price.toString() +
                                                            " \$",
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            cart.add(e);
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .add_shopping_cart_outlined,
                                                          size: 30,
                                                        ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                  ],
                                )),
                    ],
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShoppingCart(),
                            ));
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.black),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "(" + cart.productTotal().toString() + ")",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
