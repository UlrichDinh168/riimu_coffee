import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage_item.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

abstract class EnumType {}

// enum CoffeeType { arabica("Arabica"), robusto('Robusto') }

// enum TeaType implements EnumType { white, green, yellow, oolong, black }

// enum ColdBeverageType implements EnumType { cokeZero, sting, beer, cider }

// const categoryIcons = {
//   Category.food: Icons.lunch_dining,
//   Category.travel: Icons.flight_takeoff,
//   Category.leisure: Icons.movie,
//   Category.work: Icons.work,
// };

enum Category {
  water,
  time,
  app,
  info,
  cup,
  degree,
  coke,
  beer,
  bean,
  clean,
  heiniken,
  cider,
  sting
}

const categoryIcons = {
  Category.water: Icons.water_drop_outlined,
  Category.time: Icons.alarm,
  Category.app: Icons.app_blocking,
  Category.info: Icons.info_outline,
  Category.cup: Icons.coffee_outlined,
  Category.bean: Icons.crop_square,
  Category.degree: Icons.device_thermostat_outlined,

  Category.clean: Icons.calendar_month,

  // Cold beverages
  Category.coke: Icons.podcasts,
  Category.beer: Icons.search,
  Category.sting: Icons.assessment,
  Category.heiniken: Icons.rebase_edit,
  Category.cider: Icons.earbuds,
};

class Salesperson {
  final String name;
  final String? status;

  Salesperson({required this.name, this.status});
}

class DescriptionItem {
  final Category category;
  final double? total;
  final double? remain;
  final double? degree;
  final String? desc;

  DescriptionItem({
    required this.category,
    this.total,
    this.remain,
    this.degree,
    this.desc,
  });
}

class Description {
  // final Map<String, String> properties;
  final List<DescriptionItem> properties;

  Description({required this.properties});
}

class Beverage {
  Beverage({
    required this.title,
    required this.material,
    required this.types,
    required this.salespersons,
    required this.description, // Include it in the constructor
    required this.themeImage, // Include it in the constructor
    required this.beverageItem, // Include it in the constructor
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String material;
  final String themeImage;
  List<String> types;
  // List<SalesPerson> salesperson;
  // List<Description> description;
  final List<Salesperson> salespersons;
  final Description description;
  final List<BeverageSingleItem> beverageItem;

  // @override
  // String toString() {
  //   return 'Beverage(title: $title, types: $types, salesperson: $salespersons, description: $description)';
  // }
}

// class Description {
//   final Map<String, String> properties;

//   Description(this.properties);
// }

// class Description {
//   final String? cup;
//   final String? extraType;
//   final String? water;
//   final String? beansForEspresso;
//   final String? degree;
//   final String? beer;
//   final String? coke;
//   final String? time;
//   final String? clean;

//   Description({
//     this.cup,
//     this.extraType,
//     this.water,
//     this.beansForEspresso,
//     this.degree,
//     this.beer,
//     this.coke,
//     this.time,
//     this.clean,
//   });
// }

class DynamicDescription {
  final Map<String, String> properties;

  DynamicDescription(this.properties);

  T? getProperty<T>(String propertyName) {
    if (properties.containsKey(propertyName)) {
      return properties[propertyName] as T?;
    }
    return null;
  }
}

class SalesPerson {
  final String name;
  final String status;

  SalesPerson({required this.name, required this.status});
}