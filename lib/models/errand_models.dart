import 'package:flutter/material.dart';

// Model for errands
class ErrandModel {
  String errand;      
  IconData iconType; 
  String route;       

  ErrandModel({
    required this.errand,
    required this.iconType,
    required this.route,
  });

  // Returns list of available errands
  static List<ErrandModel> getErrands() {
    List<ErrandModel> errands = [];

    errands.add(
      ErrandModel(
        errand: 'Delivery',
        iconType: Icons.delivery_dining,
        route: '/delivery',
      ),
    );

    errands.add(
      ErrandModel(
        errand: 'Cleaning',
        iconType: Icons.cleaning_services,
        route: '/cleaning',
      ),
    );

    errands.add(
      ErrandModel(
        errand: 'Shopping',
        iconType: Icons.shopping_bag,
        route: '/shopping',
      ),
    );

    errands.add(
      ErrandModel(
        errand: 'Pet Sitting',
        iconType: Icons.pets,
        route: '/pet',
      ),
    );

    // Example of adding a custom errand
    /* errands.add(
      ErrandModel(
        errand: 'Custom', 
        iconType: Icons.add
      )
    ); */

    return errands;
  }
}
