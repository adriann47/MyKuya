import 'package:flutter/material.dart';

// Model for errands
class SpecializedErrandModel {
  String errand;
  String imagePath;
  String route;

  SpecializedErrandModel({
    required this.errand,
    required this.imagePath,
    required this.route
  });

  static List<SpecializedErrandModel> getErrands() {
    List<SpecializedErrandModel> specialErrands = [];

   specialErrands.add(
      SpecializedErrandModel(
        errand: 'Document Processing',
        imagePath: 'assets/icons/documents.png',
        route: '/documents'
      )
    );


    specialErrands.add(
      SpecializedErrandModel(
        errand: 'Tech Assistance',
        imagePath: 'assets/icons/tech.png',
        route: '/tech'
      )
    );

    specialErrands.add(
      SpecializedErrandModel(
        errand: 'Home Repair', 
        imagePath: 'assets/icons/homerepair.png',
        route: '/homerepair'
      )
    );

    specialErrands.add(
      SpecializedErrandModel(
        errand: 'Health and Wellness',
        imagePath: 'assets/icons/health.png',
        route: '/health'
      ),
    );
    return specialErrands;
  }
}