import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_learning_g1/model/NewsModel.dart';

class news_detail extends StatelessWidget {
  const news_detail({super.key, required this.news});
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("details"),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Text(
                news.title ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                news.description ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Image.network(news.urlToImage ?? ""),
              Text(
                news.content ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ]),
          ),
        ));
  }

  buildFixedBar(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
