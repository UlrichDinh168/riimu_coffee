import 'package:flutter/material.dart';
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
  Salesperson({required this.name, this.status});

  final String name;
  final String? status;

  factory Salesperson.fromJson(Map<String, dynamic> json) {
    return Salesperson(
      name: json['name'],
      status: json['status'],
    );
  }
}

class DescriptionItem {
  DescriptionItem({
    required this.category,
    this.total,
    this.remain,
    this.degree,
    this.desc,
  });

  final Category category;
  final double? total;
  final double? remain;
  final double? degree;
  final String? desc;

  factory DescriptionItem.fromJson(Map<String, dynamic> json) {
    return DescriptionItem(
      category: Category.values
          .firstWhere((e) => e.toString() == 'Category.${json['category']}'),
      total: json['total']?.toDouble(),
      remain: json['remain']?.toDouble(),
      degree: json['degree']?.toDouble(),
      desc: json['desc'],
    );
  }
}

class Description {
  Description({required this.properties});

  // final Map<String, String> properties;
  final List<DescriptionItem> properties;

  // factory Description.fromJson(List<Map<String, dynamic>> jsonList) {
  //   final List<DescriptionItem> items =
  //       jsonList.map((json) => DescriptionItem.fromJson(json)).toList();
  //   return Description(properties: items);
  // }

  factory Description.fromJson(List<dynamic> jsonList) {
    final List<DescriptionItem> items =
        jsonList.map((json) => DescriptionItem.fromJson(json)).toList();
    return Description(properties: items);
  }
}

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

  factory BeverageSingleItem.fromJson(Map<String, dynamic> json) {
    return BeverageSingleItem(
      title: json['title'],
      description: json['description'],
      rating: json['rating'],
      star: json['star'].toDouble(),
      image: json['image'],
    );
  }
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

  factory Beverage.fromJson(Map<String, dynamic> json) {
    final List<Salesperson> salespersons =
        (json['salespersons'] as List<dynamic>)
            .map((salespersonData) => Salesperson.fromJson(salespersonData))
            .toList();

    final Description description =
        Description.fromJson(json['description']['properties']);

    final List<BeverageSingleItem> beverageItems =
        (json['beverageItem'] as List<dynamic>)
            .map((itemData) => BeverageSingleItem.fromJson(itemData))
            .toList();

    return Beverage(
      title: json['title'],
      material: json['material'],
      types: (json['types'] as List).map((type) => type.toString()).toList(),
      salespersons: salespersons,
      description: description,
      themeImage: json['themeImage'],
      beverageItem: beverageItems,
    );
  }
}
