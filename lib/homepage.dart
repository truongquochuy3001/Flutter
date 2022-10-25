import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // title: Text("Hello world"),
      //     ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   "xin chao",
              //   style: TextStyle(fontSize: 30, color: Colors.orange),
              // ),
              Image.asset('assets/images/abc.jpg'),
              Text(
                "Oeschinen Lake Campground",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("alo");
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Icon(Icons.home),
      ),
    );
  }
}
