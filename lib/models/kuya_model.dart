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
        imagePath: 'assets/icons/shai.png',
        route: '/delivery'
      )
    );


    kuyas.add(
      KuyaModel(
        errand: 'Cleaning', 
        imagePath: 'assets/icons/asap.png',
        route: '/cleaning'
      )
    );

    kuyas.add(
      KuyaModel(
        errand: 'Shopping', 
        imagePath: 'assets/icons/ye.png',
        route: '/shopping'
      )
    );

    kuyas.add(
      KuyaModel(
        errand: 'Pet Sitting', 
        imagePath: 'assets/icons/lebron.png',
        route: '/pet'
      ),
    );
    return kuyas;
  }
}