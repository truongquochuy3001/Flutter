import 'package:flutter/material.dart';
import 'package:project_learning_g1/DestinationModel.dart';
import 'package:project_learning_g1/genre.dart';
import 'package:project_learning_g1/slider_destination.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class destinationPage extends StatelessWidget {
  const destinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderDestination(),
            GenreSlider(),
            blockTitle(),
            blockActionButton(),
            blockContent()
          ],
        ),
      ),
    );
  }

  blockImage() {
    return Image.asset("assets/images/abc.jpg");
  }

  blockTitle() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hue university of Sciences",
                style: TextStyle(fontSize: 20, color: Colors.indigoAccent),
              ),
              Text("77 Nguyen Hue")
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.red,
              ),
              Text("41")
            ],
          )
        ],
      ),
    );
  }

  blockActionButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              Text("Call"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.near_me,
                color: Colors.blue,
              ),
              Text("Route"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.share,
                color: Colors.blue,
              ),
              Text("Share"),
            ],
          ),
        ],
      ),
    );
  }

  blockContent() {
    return Container(
      margin: EdgeInsets.only(left: 60, right: 60),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      ),
    );
  }
}
