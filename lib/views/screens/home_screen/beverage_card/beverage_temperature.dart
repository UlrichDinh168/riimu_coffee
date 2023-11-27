import 'package:flutter/material.dart';

class BeverageTemperature extends StatelessWidget {
  const BeverageTemperature({super.key, required this.temperature});

  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.device_thermostat_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 10),
          Text(
            temperature,
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          )
        ],
      ),
    );
  }
}
