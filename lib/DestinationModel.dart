import 'dart:core';

class DestinationModel {
  final String id;
  final String name;
  final String image;
  final List<String> genre;
  final int rating;

  DestinationModel(this.id, this.name, this.image, this.genre, this.rating);

  static List<DestinationModel> MockData() {
    List<DestinationModel> ls = [];
    ls.add(DestinationModel(
        "1", "DoLittle", "assets/images/dolittle.jpg", [''], 4));
    ls.add(DestinationModel("2", "abc", "assets/images/dolittle.jpg", [''], 4));
    ls.add(DestinationModel("3", "xyz", "assets/images/dolittle.jpg", [''], 4));
    ls.add(DestinationModel("4", "qwe", "assets/images/dolittle.jpg", [''], 4));
    return ls;
  }
}
