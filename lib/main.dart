import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tofind_transition_app/db.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

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
              return Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: size.height * 0.02,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  showTabbar
                      ? Positioned(
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
                                      itemBuilder:
                                          (BuildContext context, int index) {
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
                        )
                      : null,
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
                          var place = places[index];
                          return Center(
                            child: Transform.translate(
                              offset: Offset(
                                0.0,
                                currentposition == (index)
                                    ? -swipeAnim1.value
                                    : 0.0,
                              ),
                              child: GestureDetector(
                                onVerticalDragStart: (details) {
                                  animationController1.forward();
                                },
                                onVerticalDragDown: (details) {
                                  animationController1.reverse();
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(
                                        0.0,
                                        currentposition == (index)
                                            ? swipeAnim2.value
                                            : 0.0,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 4,
                                                offset: Offset(0.0, 5.0))
                                          ],
                                        ),
                                        height: currentposition == (index)
                                            ? expandAnim2.value
                                            : 260.0,
                                        width: currentposition == (index)
                                            ? expandAnim1.value
                                            : 240.0,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 15,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  'La Cresenta-Montrese, CA91020 Glendale'),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text('NO. 7911827'),
                                                  Spacer(),
                                                  Row(
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .solidStar,
                                                        color:
                                                            Color(0xFF9095C7),
                                                        size: 16,
                                                      ),
                                                      SizedBox(width: 4),
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .solidStar,
                                                        color:
                                                            Color(0xFF9095C7),
                                                        size: 16,
                                                      ),
                                                      SizedBox(width: 4),
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .solidStar,
                                                        color:
                                                            Color(0xFF9095C7),
                                                        size: 16,
                                                      ),
                                                      SizedBox(width: 4),
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .solidStar,
                                                        color:
                                                            Color(0xFF9095C7),
                                                        size: 16,
                                                      ),
                                                      SizedBox(width: 4),
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .solidStar,
                                                        color:
                                                            Color(0xFFD1D2D2),
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    // color: Colors.red,
                                                    width: 140,
                                                    height: 36,
                                                    child: Stack(
                                                      children: [
                                                        ImgRoundedWidget(
                                                          image:
                                                              'assets/person-4.jpg',
                                                        ),
                                                        Positioned(
                                                          left: 34,
                                                          bottom: 0,
                                                          child:
                                                              ImgRoundedWidget(
                                                            image:
                                                                'assets/person-3.jpg',
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 68,
                                                          bottom: 0,
                                                          child:
                                                              ImgRoundedWidget(
                                                            image:
                                                                'assets/person-2.jpg',
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 102,
                                                          bottom: 0,
                                                          child:
                                                              ImgRoundedWidget(
                                                            image:
                                                                'assets/person-1.jpg',
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
                                    ),
                                    Container(
                                      width: 240.0,
                                      height: currentposition == (index)
                                          ? 300.0
                                          : 260.0,
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
                                            Positioned(
                                              bottom: 15,
                                              left: 5,
                                              right: 5,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    place.lat,
                                                    style: TextStyle(
                                                      color: Color(0xFFF5F5F6),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .mapMarkerAlt,
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
                                            )
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 4,
                                            offset: Offset(0.0, 5.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                  Positioned(
                    bottom: 65,
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
                                  // Transform.translate(
                                  //   offset: Offset(
                                  //     0.0,
                                  //     downNum1.value,
                                  //   ),
                                  //   child: Opacity(
                                  //     opacity: hideNum.value,
                                  //     child: Text(
                                  //       '$currentposition',
                                  //       style: TextStyle(
                                  //         color: Colors.indigo[300],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
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
                                          color: Colors.indigo[300],
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
                  ),
                  Positioned(
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
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class ImgRoundedWidget extends StatelessWidget {
  const ImgRoundedWidget({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
