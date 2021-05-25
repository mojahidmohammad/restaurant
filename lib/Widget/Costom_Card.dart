import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../secondPage.dart';

class CardListView extends StatelessWidget {
  const CardListView(
      {Key key,
      this.callback,
      this.imagePath,
      this.rating,
      this.reviews,
      this.titleTxt,
      this.subTxt,
      this.location,
      this.status})
      : super(key: key);

  final VoidCallback callback;
  final int reviews;
  final double rating;
  final String imagePath, titleTxt, subTxt, location, status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return secound(
              titleTxt: titleTxt,
              subTxt: subTxt,
              location: location,
              rating: rating,
              status: status,
              reviews:reviews ,
            );
          },
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: AspectRatio(
                        aspectRatio: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            imagePath,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext ctx, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xfffc7e2a)),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: new AssetImage('assets/image/bg.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      titleTxt,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          subTxt,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black26
                                                  .withOpacity(0.8)),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Icon(
                                          Icons.circle,
                                          size: 4,
                                          color:
                                              Colors.black26.withOpacity(0.8),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            location,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black26
                                                    .withOpacity(0.8)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Row(
                                        children: <Widget>[
                                          SmoothStarRating(
                                              allowHalfRating: false,
                                              starCount: 5,
                                              filledIconData: Icons.circle,
                                              defaultIconData:
                                                  FontAwesomeIcons.circle,
                                              halfFilledIconData:
                                                  FontAwesomeIcons.circle,
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
                                                fontSize: 14,
                                                color: Colors.black26
                                                    .withOpacity(0.8)),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
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
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
