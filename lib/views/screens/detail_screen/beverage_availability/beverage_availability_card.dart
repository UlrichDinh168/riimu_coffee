import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/detail_screen/beverage_availability/beverage_available_item.dart';

class BeverageAvailabilityCard extends StatelessWidget {
  const BeverageAvailabilityCard({
    super.key,
    required this.beverage,
    required this.symmetricPadding,
  });

  final Beverage beverage;
  final EdgeInsets symmetricPadding;

  @override
  Widget build(BuildContext context) {
    final List<BeverageAvailableItem> availableItems = beverage.availableItems
        .map(
          (availableItem) =>
              BeverageAvailableItem(availableItem: availableItem),
        )
        .toList();

    return SizedBox(
      key: ValueKey(beverage.id),
      width: double.infinity,
      child: Card(
        elevation: 2,
        color: const Color.fromARGB(255, 179, 227, 188),
        child: Padding(
          padding: symmetricPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${beverage.type} ${'available'}',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: availableItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
