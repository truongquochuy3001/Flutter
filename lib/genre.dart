import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:project_learning_g1/DestinationModel.dart';

class GenreSlider extends StatefulWidget {
  GenreSlider({super.key});

  @override
  State<GenreSlider> createState() => _GenreSliderState();
}

class _GenreSliderState extends State<GenreSlider> {
  List<String> _list = [
    'afshdkghkgesr',
    'bfweferg',
    'cgergrhrthrntyny',
    'dergergerbr',
    'eberberbre',
  ];
  String genreSelected = "";
  @override
  Widget build(BuildContext context) {
    // List<String> _list = [
    //   'afshdkghkgesr',
    //   'bfweferg',
    //   'cgergrhrthrntyny',
    //   'dergergerbr',
    //   'eberberbre',
    // ];
    return Container(
      height: 100,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e) => InkWell(
                  onTap: () {
                    setState(() {
                      genreSelected = e;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: (genreSelected == e ? Colors.black : Colors.red),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  blockgen(DestinationModel model) {}
}
