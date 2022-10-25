import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:project_learning_g1/provider/NewsProvider.dart';
import 'package:provider/provider.dart';
import 'news_detail.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    newsProvider.getList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ...newsProvider.list.map((e) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => news_detail(
                                news: e,
                              )));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Container(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Column(
                      children: [
                        Image.network(e.urlToImage ?? ""),
                        Text(
                          e.title ?? "Hello",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        Text(
                          e.description ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
