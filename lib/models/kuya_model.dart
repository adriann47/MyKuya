import 'package:flutter/material.dart';

// Model for errands
class KuyaModel {
  String errand;
  String imagePath;
  String route;

  KuyaModel({
    required this.errand,
    required this.imagePath,
    required this.route,
  });

  static List<KuyaModel> getkuyas() {
    List<KuyaModel> kuyas = [];

    kuyas.add(
      KuyaModel(
        errand: 'Delivery', 
        imagePath: 'assets/icons/johnweak.png',
        route: '/delivery'
      )
    );


    kuyas.add(
      KuyaModel(
        errand: 'Cleaning', 
        imagePath: 'assets/icons/franksinatra.png',
        route: '/cleaning'
      )
    );

    kuyas.add(
      KuyaModel(
        errand: 'Shopping', 
        imagePath: 'assets/icons/madong.png',
        route: '/shopping'
      )
    );

    kuyas.add(
      KuyaModel(
        errand: 'Pet Sitting', 
        imagePath: 'assets/icons/lebwrong.png',
        route: '/pet'
      ),
    );
    return kuyas;
  }
}