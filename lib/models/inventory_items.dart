import 'package:flutter/material.dart';

class InventoryItem {
  const InventoryItem({
    required this.icon,
    required this.percentageAmount,
    required this.description,
  });

  final IconData icon;
  final double percentageAmount;
  final String description;

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      icon: IconData(int.parse(json['icon']), fontFamily: 'MaterialIcons'),
      percentageAmount: json['percentageAmount'],
      description: json['description'],
    );
  }

  @override
  String toString() {
    return 'InventoryItem(icon: ${String.fromCharCode(icon.codePoint)}, '
        'percentageAmount: $percentageAmount, description: $description)';
  }
}
