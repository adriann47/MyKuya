import 'package:flutter/material.dart';

// Model for errands
class ErrandModel {
  String errand;
  String imagePath;
  String route;

  ErrandModel({
    required this.errand,
    required this.imagePath,
    required this.route,
  });

  static List<ErrandModel> getErrands() {
    List<ErrandModel> errands = [];

    errands.add(
      ErrandModel(
        errand: 'Tech Help', 
        imagePath: 'assets/icons/techhelp2.png',
        route: '/deliverypreview'
      )
    );


    errands.add(
      ErrandModel(
        errand: 'Cleaning', 
        imagePath: 'assets/icons/klining.png',
        route: '/cleaning'
      )
    );

    errands.add(
      ErrandModel(
        errand: 'Shopping', 
        imagePath: 'assets/icons/grusire.png',
        route: '/shopping'
      )
    );

    errands.add(
      ErrandModel(
        errand: 'Pet Sitting', 
        imagePath: 'assets/icons/pitsiting.png',
        route: '/pet'
      ),
    );
    return errands;
  }
}