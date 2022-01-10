import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tofind_transition_app/models/place_model.dart';
import 'package:tofind_transition_app/widgets/placebackpart_widget.dart';
import 'package:tofind_transition_app/widgets/placefrontpart_widget.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({
    Key key,
    @required this.currentposition,
    @required this.swipeAnim1,
    @required this.animationController1,
    @required this.swipeAnim2,
    @required this.expandAnim2,
    @required this.expandAnim1,
    @required this.place,
    @required this.index,
  }) : super(key: key);

  final int currentposition;
  final Animation swipeAnim1;
  final AnimationController animationController1;
  final Animation swipeAnim2;
  final Animation expandAnim2;
  final Animation expandAnim1;
  final Place place;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(
          0.0,
          currentposition == (index) ? -swipeAnim1.value : 0.0,
        ),
        child: GestureDetector(
          onVerticalDragStart: (details) {
            animationController1.forward();
          },
          onVerticalDragDown: (details) {
            animationController1.reverse();
          },
          onLongPress: () {
            Navigator.pushNamed(
              context,
              'details',
              arguments: Place(
                id: place.id,
                name: place.name,
                image: place.image,
                lat: place.lat,
                lng: place.lng,
              ),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              PlaceBackPartWidget(
                currentposition: currentposition,
                swipeAnim2: swipeAnim2,
                expandAnim2: expandAnim2,
                expandAnim1: expandAnim1,
                index: index,
              ),
              PlaceFrontPartWidget(
                currentposition: currentposition,
                place: place,
                index: index,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
