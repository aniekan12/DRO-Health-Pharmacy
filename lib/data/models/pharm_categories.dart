import 'package:dro_health_phamarcy/utils/constants.dart';
import 'package:flutter/material.dart';

class PharmCategories {
  final int? id;
  final String? categoryName;
  final String? categoryImage;

  PharmCategories(
      {@required this.id,
      @required this.categoryName,
      @required this.categoryImage});
}

List<PharmCategories> pharmCategories = [
  PharmCategories(
    id: 1,
    categoryName: 'Headache',
    categoryImage: '$SVG_ASSETS_BASE/headache_small.png',
  ),
  PharmCategories(
    id: 2,
    categoryName: 'Supplements',
    categoryImage: '$SVG_ASSETS_BASE/supplements_small.png',
  ),
  PharmCategories(
    id: 3,
    categoryName: 'Infants',
    categoryImage: '$SVG_ASSETS_BASE/infants_small.png',
  ),
];

List<PharmCategories> largepharmCategories = [
  PharmCategories(
    id: 1,
    categoryName: 'Headache',
    categoryImage: '$SVG_ASSETS_BASE/headache.png',
  ),
  PharmCategories(
    id: 2,
    categoryName: 'Supplements',
    categoryImage: '$SVG_ASSETS_BASE/supplements.png',
  ),
  PharmCategories(
    id: 3,
    categoryName: 'Infants',
    categoryImage: '$SVG_ASSETS_BASE/infants.png',
  ),
  PharmCategories(
    id: 3,
    categoryName: 'Cough',
    categoryImage: '$SVG_ASSETS_BASE/cough.png',
  ),
];
