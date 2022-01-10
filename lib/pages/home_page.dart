import 'package:flutter/material.dart';
import 'package:tofind_transition_app/db/db.dart';
import 'package:tofind_transition_app/models/place_model.dart';
import 'package:tofind_transition_app/widgets/appbar_widget.dart';
// import 'package:tofind_transition_app/widgets/bottombar_widget.dart';
import 'package:tofind_transition_app/widgets/pageviewindicator_widget.dart';
import 'package:tofind_transition_app/widgets/place_widget.dart';
// import 'package:tofind_transition_app/widgets/tabbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController pageController;
  AnimationController animationController1;
  AnimationController animationController2;
  Animation swipeAnim1;
  Animation swipeAnim2;
  Animation expandAnim1;
  Animation expandAnim2;
  Animation hideTabbar;
  Animation downNum1;
  Animation downNum2;
  Animation hideNum;
  Animation showNum;

  Place place;

  int total = places.length;

  int currentposition = 1;

  bool showTabbar = true;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    );

    animationController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    swipeAnim1 = Tween(begin: 0.0, end: 80.0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.0, 1.0),
      ),
    );

    swipeAnim2 = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.0, 1.0),
      ),
    );

    expandAnim1 = Tween(begin: 240.0, end: 280.0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.0, 1.0),
      ),
    );

    expandAnim2 = Tween(begin: 300.0, end: 380.0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.0, 1.0),
      ),
    );

    hideTabbar = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.0, 1.0),
      ),
    );

    downNum1 = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Interval(0.0, 1.0),
      ),
    );

    downNum2 = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Interval(0.0, 1.0),
      ),
    );

    hideNum = Tween(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Interval(0.0, 1.0),
      ),
    );

    showNum = Tween(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Interval(0.0, 1.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFA0B1C0),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: animationController1,
          builder: (context, child) {
            return Container(
              child: Stack(
                children: [
                  AppbarWidget(size: size),
                  Positioned(
                    top: size.height * 0.10,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 480,
                      // color: Colors.purple,
                      child: PageView.builder(
                        itemCount: places.length,
                        controller: pageController,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          place = places[index];
                          return PlaceWidget(
                            currentposition: currentposition,
                            swipeAnim1: swipeAnim1,
                            animationController1: animationController1,
                            swipeAnim2: swipeAnim2,
                            expandAnim2: expandAnim2,
                            expandAnim1: expandAnim1,
                            place: place,
                            index: index,
                          );
                        },
                        onPageChanged: (int value) {
                          setState(() {
                            currentposition = value;

                            animationController2.reset();
                            animationController2.forward();
                          });
                        },
                      ),
                    ),
                  ),
                  PageviewIndicatorWidget(
                    animationController2: animationController2,
                    downNum2: downNum2,
                    showNum: showNum,
                    currentposition: currentposition,
                    total: total,
                  ),
                  // BottomBarWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
