import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage_item.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

abstract class EnumType {}

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
    required this.description,
    required this.themeImage,
    required this.beverageItem,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String material;
  final String themeImage;
  List<String> types;
  final List<Salesperson> salespersons;
  final Description description;
  final List<BeverageSingleItem> beverageItem;
}
