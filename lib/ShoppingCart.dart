import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_learning_g1/Product.dart';
import 'package:project_learning_g1/model/Cart.dart';
import 'package:project_learning_g1/model/Product.dart';
import 'package:project_learning_g1/provider/ProductProvider.dart';
import 'CartList.dart' as cart;

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ProductsPage())));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "Products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...cart.list.map(
                    (e) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 8,
                            child: Image.network(
                              e.model.image.toString(),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.model.title.toString(),
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  e.model.price.toString() + " USD",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            for (int i = 0;
                                                i < cart.list.length;
                                                i++) {
                                              if (cart.list[i].model.id ==
                                                  e.model.id) {
                                                cart.list[i].quantity--;
                                                if (cart.list[i].quantity < 1) {
                                                  cart.list.remove(e);
                                                }
                                              }
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.remove)),
                                    Text(e.quantity.toString()),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          for (int i = 0;
                                              i < cart.list.length;
                                              i++) {
                                            if (cart.list[i].model.id ==
                                                e.model.id) {
                                              cart.list[i].quantity++;
                                            }
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cart.list.remove(e);
                                    });
                                  },
                                  icon: Icon(Icons.delete),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ].toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(45),
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total products",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              cart.productTotal().toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total price",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              cart.total().toStringAsFixed(2) + " USD",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
