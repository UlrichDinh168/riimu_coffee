import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:riimu_coffee/models/inventory_items.dart';

class BeverageInventoryItems extends StatelessWidget {
  const BeverageInventoryItems({super.key, required this.inventoryItems});

  final List<InventoryItem> inventoryItems;

  @override
  Widget build(BuildContext context) {
    final inventoryColumnItems = inventoryItems.map(
      (item) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(item.icon, color: Theme.of(context).colorScheme.onPrimary),
            // Triggers an error, unsure why
            LinearPercentIndicator(
              width: 120,
              percent: item.percentageAmount,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              barRadius: const Radius.circular(10),
            ),
            Text(
              item.description,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ],
        ),
      ),
    );

    return Column(
      children: [...inventoryColumnItems],
    );
  }
}
