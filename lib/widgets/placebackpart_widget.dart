import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'imagerounded_widget.dart';

class PlaceBackPartWidget extends StatelessWidget {
  const PlaceBackPartWidget({
    Key key,
    @required this.currentposition,
    @required this.swipeAnim2,
    @required this.expandAnim2,
    @required this.expandAnim1,
    @required this.index,
  }) : super(key: key);

  final int currentposition;
  final Animation swipeAnim2;
  final Animation expandAnim2;
  final Animation expandAnim1;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        0.0,
        currentposition == (index) ? swipeAnim2.value : 0.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 4,
                offset: Offset(0.0, 5.0))
          ],
        ),
        height: currentposition == (index) ? expandAnim2.value : 260.0,
        width: currentposition == (index) ? expandAnim1.value : 240.0,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('La Cresenta-Montrese, CA91020 Glendale'),
              SizedBox(height: 5),
              Row(
                children: [
                  Text('NO. 7911827'),
                  Spacer(),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Color(0xFF9095C7),
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Color(0xFF9095C7),
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Color(0xFF9095C7),
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Color(0xFF9095C7),
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Color(0xFFD1D2D2),
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2),
              Divider(),
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // color: Colors.red,
                    width: 140,
                    height: 36,
                    child: Stack(
                      children: [
                        ImgRoundedWidget(
                          image: 'assets/person-4.jpg',
                          tag: 'person-4',
                        ),
                        Positioned(
                          left: 34,
                          bottom: 0,
                          child: ImgRoundedWidget(
                            image: 'assets/person-3.jpg',
                            tag: 'person-3',
                          ),
                        ),
                        Positioned(
                          left: 68,
                          bottom: 0,
                          child: ImgRoundedWidget(
                            image: 'assets/person-2.jpg',
                            tag: 'person-2',
                          ),
                        ),
                        Positioned(
                          left: 102,
                          bottom: 0,
                          child: ImgRoundedWidget(
                            image: 'assets/person-1.jpg',
                            tag: 'person-1',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
