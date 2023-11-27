import 'package:flutter/material.dart';

class BeverageBrewingTime extends StatelessWidget {
  const BeverageBrewingTime({super.key, required this.minutes});

  final String minutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.access_time_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 10),
          Text(
            'Brewed $minutes minutes ago',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      ),
    );
  }
}
