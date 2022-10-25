import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Special extends StatelessWidget {
  const Special({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              buildIcon(context),
              buildTitle(context),
              buildImages(context),
              buildTextMenu(context),
              buildMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  buildIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ],
    );
  }

  buildTitle(BuildContext context) {
    return Row(
      children: [
        Text(
          "Today's Special",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Image.asset('assets/images.abc.jpg')
      ],
    );
  }

  buildImages(BuildContext context) {
    return Container();
  }

  buildTextMenu(BuildContext context) {
    return Container();
  }

  buildMenu(BuildContext context) {
    return Container();
  }
}
