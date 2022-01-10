import 'package:flutter/material.dart';

class PageviewIndicatorWidget extends StatelessWidget {
  const PageviewIndicatorWidget({
    Key key,
    @required this.animationController2,
    @required this.downNum2,
    @required this.showNum,
    @required this.currentposition,
    @required this.total,
  }) : super(key: key);

  final AnimationController animationController2;
  final Animation downNum2;
  final Animation showNum;
  final int currentposition;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: animationController2,
        builder: (context, child) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(
                        0.0,
                        downNum2.value,
                      ),
                      child: Opacity(
                        opacity: showNum.value,
                        child: Text(
                          '${currentposition + 1}',
                          style: TextStyle(
                            color: Color(0xFFF5F5F6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  ' / $total',
                  style: TextStyle(
                    color: Color(0xFFF5F5F6),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
