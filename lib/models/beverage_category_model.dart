import 'package:uuid/uuid.dart';

const uuid = Uuid();

class BeverageCategory {
  BeverageCategory({
    required this.title,
    required this.category,
    required this.description,
    required this.rating,
    required this.star,
  }) : id = uuid.v4();

  final String id;
  final String category;
  final String title;
  List<String> description;
  // List<SalesPerson> salesperson;
  // List<Description> description;
  final double rating;
  final int star;
}
