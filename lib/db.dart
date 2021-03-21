import 'package:flutter/material.dart';

class Place {
  final String name;
  final String image;
  final String lat;
  final String lng;

  Place({
    @required this.name,
    @required this.image,
    @required this.lat,
    @required this.lng,
  });
}

List<Place> places = [
  Place(
    name: 'ATCOASTAL',
    image: 'assets/city-1.jpg',
    lat: 'NORTH LAT 24',
    lng: 'EAST LNG 17',
  ),
  Place(
    name: 'SYRAPUSE',
    image: 'assets/city-2.jpg',
    lat: 'NORTH LAT 36',
    lng: 'EAST LNG 97',
  ),
  Place(
    name: 'NEW YORK',
    image: 'assets/city-3.jpg',
    lat: 'NORTH LAT 13',
    lng: 'EAST LNG 04',
  ),
  Place(
    name: 'ATCOASTAL',
    image: 'assets/city-1.jpg',
    lat: 'NORTH LAT 24',
    lng: 'EAST LNG 17',
  ),
  Place(
    name: 'SYRAPUSE',
    image: 'assets/city-2.jpg',
    lat: 'NORTH LAT 36',
    lng: 'EAST LNG 97',
  ),
  Place(
    name: 'NEW YORK',
    image: 'assets/city-3.jpg',
    lat: 'NORTH LAT 13',
    lng: 'EAST LNG 04',
  ),
];
