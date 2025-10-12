import 'package:flutter/material.dart';

class ErrandModel {
  String errand;
  String imagePath;
  String rate;
  String type;
  String route;

  ErrandModel({
    required this.errand,
    required this.imagePath,
    required this.rate,
    required this.type,
    required this.route,
  });

  // Persistent list
  static final List<ErrandModel> _errands = [
    ErrandModel(
      errand: 'Tech Help',
      imagePath: 'assets/icons/techhelp2.png',
      rate: '100',
      type: 'Tech Help',
      route: '/deliverypreview',
    ),
    ErrandModel(
      errand: 'Cleaning',
      imagePath: 'assets/icons/klining.png',
      rate: '300',
      type: 'Cleaning',
      route: '/cleaningpreview',
    ),
    ErrandModel(
      errand: 'Shopping',
      imagePath: 'assets/icons/grusire.png',
      rate: '70',
      type: 'Shopping',
      route: '/shoppingpreview',
    ),
    ErrandModel(
      errand: 'Pet Sitting',
      imagePath: 'assets/icons/pitsiting.png',
      rate: '200',
      type: 'Pet Sitting',
      route: '/petpreview',
    ),
  ];

  static List<ErrandModel> getErrands() => _errands;

  static void addErrand(ErrandModel newErrand) {
    _errands.add(newErrand);
  }
}
