import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({
    Key key,
    @required this.size,
    @required this.hideTabbar,
    @required this.pageController,
  }) : super(key: key);

  final Size size;
  final Animation hideTabbar;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: size.height * 0.16,
      child: Transform.scale(
        scale: hideTabbar.value,
        child: Container(
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 230,
                height: 14,
                child: ListView.builder(
                  controller: pageController,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        'outdoors',
                        style: TextStyle(
                          color: Color(0xFFF5F5F6),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                indent: size.width * 0.12,
                endIndent: size.width * 0.12,
                color: Color(0xFFF5F5F6),
              )
            ],
          ),
        ),
      ),
    );
  }
}
