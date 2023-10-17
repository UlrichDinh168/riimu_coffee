import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage.dart';

class SalespersonInfo extends StatelessWidget {
  const SalespersonInfo({super.key, required this.salespersons});

  final List<Salesperson> salespersons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...salespersons.map((sp) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/team/${sp.name[0].toLowerCase() + sp.name.substring(1)}.jpg'),
                  radius: 20.0,
                ),
                const SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sp.name),
                    Text(
                      sp.status ?? 'Occasional drinker',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red[400],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
