import 'package:uuid/uuid.dart';

const uuid = Uuid();

class BeverageSingleItem {
  BeverageSingleItem({
    required this.title,
    required this.description,
    required this.rating,
    required this.star,
    required this.image,
  });

  final String title;
  final String description;
  final int rating;
  final double star;
  final String image;
}
