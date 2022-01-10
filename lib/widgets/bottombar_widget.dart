import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FaIcon(
            FontAwesomeIcons.thumbtack,
            size: 18,
            color: Color(0xFFF5F5F6),
          ),
          FaIcon(
            FontAwesomeIcons.mapMarkerAlt,
            size: 18,
            color: Color(0xFFF5F5F6),
          ),
          FaIcon(
            FontAwesomeIcons.userAlt,
            size: 18,
            color: Color(0xFFF5F5F6),
          ),
        ],
      ),
    );
  }
}
