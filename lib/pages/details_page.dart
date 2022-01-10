import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tofind_transition_app/models/place_model.dart';
import 'package:tofind_transition_app/widgets/appbar_widget.dart';
import 'package:tofind_transition_app/widgets/placedata_widget.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Place args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: args.id,
                      child: Image(
                        image: AssetImage(args.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    AppbarWidget(size: size),
                    PlaceDataWidget(place: args),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.18,
                width: size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(
                      image: AssetImage('assets/map.png'),
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'La Cresenta-Montrese, CA91020 Glendale',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'NO. 7911827',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Color(0xFF9095C7),
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Color(0xFF9095C7),
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Color(0xFF9095C7),
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Color(0xFF9095C7),
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Color(0xFFD1D2D2),
                                size: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CommentWidget(
                name: 'Peter Allan',
                image: 'assets/person-4.jpg',
                tag: 'person-4',
              ),
              Divider(),
              CommentWidget(
                name: 'Peter Allan',
                image: 'assets/person-3.jpg',
                tag: 'person-3',
              ),
              Divider(),
              CommentWidget(
                name: 'Peter Allan',
                image: 'assets/person-2.jpg',
                tag: 'person-2',
              ),
              Divider(),
              CommentWidget(
                name: 'Peter Allan',
                image: 'assets/person-1.jpg',
                tag: 'person-1',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key key,
    @required this.name,
    @required this.image,
    @required this.tag,
  }) : super(key: key);

  final String name;
  final String image;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Hero(
                          tag: tag,
                          child: Image(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(),
                    ),
                    Text(
                      'FEB 14th',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              FaIcon(
                FontAwesomeIcons.thumbsUp,
                color: Colors.grey[400],
                size: 16,
              )
            ],
          ),
          SizedBox(height: 10),
          Container(
            child: Text(
              'The federal beach atc requires states that receive funding to develop a risk-based beach evalution and classification plan and aply it to...',
              style: TextStyle(
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
