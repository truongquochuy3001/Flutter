import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SliderDestination extends StatelessWidget {
  SliderDestination({super.key});

  List<String> _list = [
    'assets/images/abc.jpg',
    'assets/images/abc.jpg',
    'assets/images/abc.jpg',
    'assets/images/abc.jpg',
    'assets/images/abc.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e) {
              return Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
