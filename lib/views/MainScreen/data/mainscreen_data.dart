import 'package:flutter/material.dart';

List<Map<String, dynamic>> popularPlacesDatas = [
  {
    'id': 0,
    'point': '4.1',
    'title': 'Alley Palace',
    'image': 'assets/png/AlleyPalace.png',
  },
  {
    'id': 1,
    'title': 'Coeurdes Alpes',
    'description':
        'Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....',
    'price': '\$${199}',
    'point': '4.5',
    'reviews': '355',
    'image': [
      'assets/png/CeurdesAlpes.png',
      'assets/png/CeurdsAlpesDetailsPagePhoto.png',
    ],
    'features': [
      {'heater': 'heater', 'heaterIcon': Icons.wifi},
      {'dinner': 'Diner', 'dinnerIcon': Icons.food_bank},
      {'tub': '1 tub', 'tubIcon': Icons.shower_outlined},
      {'pool': 'Pool', 'poolIcon': Icons.pool},
    ],
  }
];
List<Map<String, dynamic>> recommendedPlacesDatas = [
  {'title': 'Explore Aspen', 'image': 'assets/png/ExploreAspen.png'},
  {'title': 'Luxurious Aspen', 'image': 'assets/png/LuxuriousAspen.png'}
];

List<Map<String, dynamic>> categories = [
  {'category': 'Location'},
  {'category': 'Hotels'},
  {'category': 'Food'},
  {'category': 'Adventure'},
];
