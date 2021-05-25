import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Widget/Costom_Card.dart';
import 'package:restaurant/Widget/Costom_Card.dart';
import 'package:restaurant/Widget/custom_menu.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rating = 3.0;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff5ef),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 75, left: 20.0),
            child: Container(
              child: Text(
                "Best New York City restaurants",
                style: TextStyle(
                  letterSpacing: -1.2,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),




          CardListView(
            titleTxt: "Keika Ramen",
            status: "open Now",
            rating: 2.9,
            location: "japan",
            subTxt: "classic",
            reviews: 88,
            imagePath:
                "https://www.calgarystampede.com/sites/default/files/chocolate-chip-doughnut_1200x600.jpg",
          ),
          CardListView(
            titleTxt: "Keika Ramen",
            status: "open Now",
            rating: 2.9,
            location: "japan",
            subTxt: "classic",
            reviews: 88,
            imagePath:
                "https://www.calgarystampede.com/sites/default/files/chocolate-chip-doughnut_1200x600.jpg",
          ),
        ],
      )),
    );
  }
}
