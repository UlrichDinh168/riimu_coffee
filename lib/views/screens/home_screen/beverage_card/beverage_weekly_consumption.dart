import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:riimu_coffee/models/available_items.dart';

final random = Random();

class BeverageWeeklyConsumption extends StatelessWidget {
  const BeverageWeeklyConsumption({super.key, required this.item});

  final AvailableItem item;

  @override
  Widget build(BuildContext context) {
    List<Widget> daysConsumption = item.weekConsuption
        .map(
          (consumptionPercentage) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 17.5),
            child: RotatedBox(
              quarterTurns: 3,
              child: LinearPercentIndicator(
                width: 120,
                percent: consumptionPercentage,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                barRadius: const Radius.circular(10),
              ),
            ),
          ),
        )
        .toList();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            item.imageUrl,
            height: 120,
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: daysConsumption,
              ),
              Text('Consumption up ${random.nextInt(8) + 1} bottles last week')
            ],
          )
        ],
      ),
    );
  }
}
