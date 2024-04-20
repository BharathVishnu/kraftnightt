import 'package:flutter/material.dart';

class Itinerary {
  Image? img;
  String? name;
  String? type;

  Itinerary({this.img, this.name, this.type});
}

List<Itinerary> itineraries = [
  Itinerary(
    // img: Image('image1.jpg'),
    name: 'Beach Trip',
    type: 'All',
  ),
  Itinerary(
    // img: Image('image2.jpg'),
    name: 'Mountain Hike',
    type: 'Adventure',
  ),
  Itinerary(
    // img: Image('image3.jpg'),
    name: 'City Tour',
    type: 'personnal',
  ),
  Itinerary(
    // img: Image('image4.jpg'),
    name: 'Cultural Immersion',
    type: 'recommendation',
  ),
  Itinerary(
    // img: Image('image5.jpg'),
    name: 'Safari Expedition',
    type: 'friends',
  ),
];
