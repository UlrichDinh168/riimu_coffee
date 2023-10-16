import 'package:flutter/material.dart';

class BeverageType extends StatelessWidget {
  const BeverageType({super.key, required this.beverageTypes});

  final List<String> beverageTypes;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: beverageTypes.map((type) {
        return Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              type,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }
}
