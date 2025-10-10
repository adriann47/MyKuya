import 'package:flutter/material.dart';

// Model for errands
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

  static List<ErrandModel> getErrands() {
    List<ErrandModel> errands = [];

    errands.add(
      ErrandModel(
        errand: 'Tech Help', 
        imagePath: 'assets/icons/techhelp2.png',
        rate: '100',
        type: 'Tech Help',
        route: '/deliverypreview'
      )
    );


    errands.add(
      ErrandModel(
        errand: 'Cleaning', 
        imagePath: 'assets/icons/klining.png',
        rate: '300',
        type: 'Cleaning',
        route: '/cleaningpreview'
      )
    );

    errands.add(
      ErrandModel(
        errand: 'Shopping', 
        imagePath: 'assets/icons/grusire.png',
        rate: '70',
        type: 'Shopping',
        route: '/shoppingpreview'
      )
    );

    errands.add(
      ErrandModel(
        errand: 'Pet Sitting', 
        imagePath: 'assets/icons/pitsiting.png',
        rate: '200',
        type: 'Pet Sitting',
        route: '/petpreview'
      ),
    );
    return errands;
  }
}