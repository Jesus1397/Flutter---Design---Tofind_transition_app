import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tofind_transition_app/models/place_model.dart';

class PlaceDataWidget extends StatelessWidget {
  const PlaceDataWidget({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 5,
      right: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            place.lat,
            style: TextStyle(
              color: Color(0xFFF5F5F6),
              fontSize: 13,
            ),
          ),
          FaIcon(
            FontAwesomeIcons.mapMarkerAlt,
            color: Color(0xFFF5F5F6),
            size: 13,
          ),
          Text(
            place.lng,
            style: TextStyle(
              color: Color(0xFFF5F5F6),
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
