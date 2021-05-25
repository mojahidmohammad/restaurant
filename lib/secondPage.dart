import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/Widget/custom_menu.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class secound extends StatelessWidget {
  const secound(
      {Key key,
      this.titleTxt,
      this.subTxt,
      this.location,
      this.status,
      this.rating,
      this.reviews})
      : super(key: key);
  final String titleTxt, subTxt, location, status;
  final int reviews;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff5ef),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getAppBarUI(context,
                  location: location,
                  rating: rating,
                  reviews: reviews.toString(),
                  status: status,
                  subTxt: subTxt,
                  titleTxt: titleTxt),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('King Delight',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 18),)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      MenuListView(
                        titleTxt: "Keika Ramen",
                        imagePath:
                        "https://www.calgarystampede.com/sites/default/files/chocolate-chip-doughnut_1200x600.jpg",
                        status: "open Now",
                        price: 15,

                      ),
                      MenuListView(
                        titleTxt: "Keika Ramen",
                        imagePath:
                        "https://www.calgarystampede.com/sites/default/files/chocolate-chip-doughnut_1200x600.jpg",
                        status: "open Now",
                        price: 15,

                      ),
                      MenuListView(
                        titleTxt: "Keika Ramen",
                        imagePath:
                        "https://www.calgarystampede.com/sites/default/files/chocolate-chip-doughnut_1200x600.jpg",
                        status: "open Now",
                        price: 15,

                      ),
                    ],
                  ),
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}

Widget getAppBarUI(context,
    {titleTxt, subTxt, location, status, reviews, rating}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,

    ),
    child: Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 8, right: 8),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                width: AppBar().preferredSize.height - 10,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
              ),
              Text(
                titleTxt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  subTxt,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black26.withOpacity(0.8)),
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.circle,
                  size: 4,
                  color: Colors.black26.withOpacity(0.8),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    location,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14, color: Colors.black26.withOpacity(0.8)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 20.0),
            child: Row(
              children: <Widget>[
                SmoothStarRating(
                    allowHalfRating: false,
                    starCount: 5,
                    filledIconData: Icons.circle,
                    defaultIconData: FontAwesomeIcons.circle,
                    halfFilledIconData: FontAwesomeIcons.circle,
                    spacing: 2,
                    rating: rating,
                    size: 20,
                    color: Color(0xffffcd3f),
                    borderColor: Colors.black54),
                SizedBox(
                  width: 8,
                ),
                Text(
                  reviews.toString(),
                  style: TextStyle(
                      fontSize: 14, color: Colors.black26.withOpacity(0.8)),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    status,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xfffc7e2a),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
