import 'package:flutter/material.dart';

class ImgRoundedWidget extends StatelessWidget {
  const ImgRoundedWidget({
    Key key,
    @required this.image,
    @required this.tag,
  }) : super(key: key);

  final String image;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Hero(
          tag: tag,
          child: Image(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
