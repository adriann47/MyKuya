import 'package:flutter/material.dart';

// Model for errands
class KuyaModel {
  String kuya;
  String imagePath;
  String work;
  String route;

  KuyaModel({
    required this.kuya,
    required this.imagePath,
    required this.work,
    required this.route,
  });

  static List<KuyaModel> getkuyas() {
    List<KuyaModel> kuyas = [];

    kuyas.add(
      KuyaModel(
        kuya: 'Kuya Shai', 
        imagePath: 'assets/icons/shai.png',
        work: 'Tech Specialist',
        route: '/delivery'
      )
    );


    kuyas.add(
      KuyaModel(
        kuya: 'Kuya Rocky', 
        imagePath: 'assets/icons/asap.png',
        work: 'Cleaner',
        route: '/cleaning'
      )
    );

    kuyas.add(
      KuyaModel(
        kuya: 'Kuya Ye', 
        imagePath: 'assets/icons/ye.png',
        work: 'Shopping God',
        route: '/shopping'
      )
    );

    kuyas.add(
      KuyaModel(
        kuya: 'Kuya Bron', 
        imagePath: 'assets/icons/lebron.png',
        work: 'Pet Sitter',
        route: '/pet'
      ),
    );
    return kuyas;
  }
}