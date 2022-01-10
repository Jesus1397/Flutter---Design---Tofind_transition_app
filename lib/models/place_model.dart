import 'package:flutter/material.dart';

class Place {
  final String id;

  final String name;
  final String image;
  final String lat;
  final String lng;

  Place({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.lat,
    @required this.lng,
  });
}
