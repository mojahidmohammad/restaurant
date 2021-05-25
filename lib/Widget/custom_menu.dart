import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuListView extends StatelessWidget {
  const MenuListView(
      {Key key, this.imagePath, this.price, this.titleTxt, this.status})
      : super(key: key);

  final int price;

  final String imagePath, titleTxt, status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                width: 125,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                    image: new AssetImage('assets/image/bg.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    titleTxt,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '${price.toString()} \$',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Color(0xfffc7e2a).withOpacity(0.8)),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OutlineButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                print(  prefs.getString('access_token'));

                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: Color(0xfffc7e2a),
                      size: 12,
                    ),
                    const Text(
                      "ADD",
                      style: TextStyle(
                          color: Color(0xfffc7e2a),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                borderSide: BorderSide(color: Color(0xfffc7e2a), width: 1),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color(0xfffc7e2a),
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
