import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_learning_g1/Login.dart';

class FoodPage extends StatelessWidget {
  FoodPage({super.key});

  List<String> list = [
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
  ];

  bool showGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Button(context),
              SizedBox(
                height: 15,
              ),
              TitleBar(context),
              SizedBox(
                height: 10,
              ),
              Subtitle(context),
              SizedBox(
                height: 10,
              ),
              Menu(context),
              SizedBox(
                height: 30,
              ),
              MenuTitle(context),
              SizedBox(
                height: 30,
              ),
              MenuList(context),
            ],
          ),
        ),
      ),
    );
  }

  Button(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.arrow_back)),
        Icon(Icons.search),
      ],
    );
  }

  TitleBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today's Special",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 112, 236, 116),
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  offset: Offset(1, 5),
                )
              ]),
          width: 100,
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              Text(
                "CART",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Menu(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: double.infinity,
            width: (MediaQuery.of(context).size.width / 10) * 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 59, 196, 250),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 136, 241, 245),
                    offset: Offset(1, 9),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Image.asset("assets/images/Picture1.png"),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Yoshimura Sushi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 17,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 17,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 17,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 17,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 17,
                        color: Colors.white,
                      ),
                      Text(
                        "250 Ratings",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem ipsum is a dumming text for printing",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: (MediaQuery.of(context).size.width / 11) * 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 330 / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 107, 235, 111),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 148, 242, 245),
                          offset: Offset(1, 9),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/Picture2.png"),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Yoshimura Sushi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 330 / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 58, 58, 58),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 9),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/Picture3.png"),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Prato Sushi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  MenuTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Places",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 250,
          height: 20,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ))),
        )
      ],
    );
  }

  MenuList(BuildContext context) {
    return Column(
      children: [
        PlacesLists(
            "assets/images/Picture4.png", "Sushi Den", 5, "Lorem ipsum"),
        SizedBox(
          height: 40,
        ),
        PlacesLists(
            "assets/images/Picture5.png", "Hatsuhana Sushi", 5, "Lorem ipsum"),
      ],
    );
  }

  Subtitle(BuildContext context) {
    return Text(
      "Find out what's cooking today !",
      style: TextStyle(
        color: Color.fromARGB(181, 175, 175, 175),
        fontSize: 15,
      ),
    );
  }

  PlacesLists(String image, String name, int rating, String content) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
            Container(
              width: 150,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Row(
                    children: [
                      for (var i = 0; i < rating; i++)
                        Icon(
                          Icons.star,
                          size: 17,
                          color: Colors.amber,
                        ),
                    ],
                  ),
                  Text("lorem ipsum"),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green,
              ),
              child: Center(
                child: Text("Order now"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
