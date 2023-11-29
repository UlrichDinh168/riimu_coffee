import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/available_items.dart';
import 'package:riimu_coffee/views/screens/detail_screen/beverage_availability/beverage_weekly_consumption.dart';

class BeverageConsumption extends StatelessWidget {
  const BeverageConsumption({
    super.key,
    required this.beverageAvailableItems,
  });

  final List<AvailableItem> beverageAvailableItems;

  @override
  Widget build(BuildContext context) {
    final List<Widget> availableItemsConsumption = beverageAvailableItems
        .map(
          (availableItem) => BeverageWeeklyConsumption(
            item: availableItem,
          ),
        )
        .toList();

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'average-consumption',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          ...availableItemsConsumption
        ],
      ),
    );
  }
}
