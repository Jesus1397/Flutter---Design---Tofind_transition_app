import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(
              FontAwesomeIcons.search,
              size: 18,
              color: Color(0xFFF5F5F6),
            ),
            Text(
              'INTEREST',
              style: TextStyle(
                color: Color(0xFFF5F5F6),
                fontWeight: FontWeight.w500,
              ),
            ),
            FaIcon(
              FontAwesomeIcons.crosshairs,
              size: 18,
              color: Color(0xFFF5F5F6),
            ),
          ],
        ),
      ),
    );
  }
}
