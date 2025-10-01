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
        errand: 'Delivery', 
        imagePath: 'assets/icons/delivery.jpg',
        route: '/delivery'
      )
    );


    errands.add(
      ErrandModel(
        errand: 'Cleaning', 
        imagePath: 'assets/icons/cleaning.jpg',
        route: '/cleaning'
      )
    );

    errands.add(
      ErrandModel(
        errand: 'Shopping', 
        imagePath: 'assets/icons/shopping.jpg',
        route: '/shopping'
      )
    );

    errands.add(
      ErrandModel(
        errand: 'Pet Sitting', 
        imagePath: 'assets/icons/pet.png',
        route: '/pet'
      ),
    );
    return errands;
  }
}