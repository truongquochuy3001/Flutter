import 'dart:core';

class NewsModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAT;
  String? content;
  NewsModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAT,
      this.content});
  factory NewsModel.fromJson(Map<String, dynamic> obj) {
    return NewsModel(
        author: obj['author'],
        title: obj['title'],
        description: obj['description'],
        url: obj['url'],
        urlToImage: obj['urlToImage'],
        // publishedAT: obj['publishedAT'],
        content: obj['content']);
  }
}
