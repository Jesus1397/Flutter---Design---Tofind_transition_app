import 'package:flutter/material.dart';
import 'package:tofind_transition_app/models/place_model.dart';
import 'package:tofind_transition_app/widgets/placedata_widget.dart';

class PlaceFrontPartWidget extends StatelessWidget {
  const PlaceFrontPartWidget({
    Key key,
    @required this.currentposition,
    @required this.place,
    @required this.index,
  }) : super(key: key);

  final int currentposition;
  final Place place;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      height: currentposition == (index) ? 300.0 : 260.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage(place.image),
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Text(
                place.name,
                style: TextStyle(
                  color: Color(0xFFF5F5F6),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            PlaceDataWidget(place: place)
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 4,
            offset: Offset(0.0, 5.0),
          )
        ],
      ),
    );
  }
}
