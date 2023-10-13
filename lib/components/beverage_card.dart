import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/filter_coffee.dart';

class BeverageCard extends StatelessWidget {
  const BeverageCard({
    Key? key,
    required this.beverage,
    required this.showDetails,
  }) : super(key: key);

  final Beverage beverage;
  final void Function() showDetails;

  @override
  Widget build(BuildContext context) {
    final categoryMap = {
      Category.water: 'water',
      Category.time: 'time',
      Category.app: 'app',
      Category.info: 'info',
      Category.cup: 'cup',
      Category.degree: 'degree',

      Category.bean: 'bean',
      Category.clean: 'clean',
      //
      Category.coke: 'coke',
      Category.beer: 'beer',
      Category.sting: 'sting',
      Category.heiniken: 'heiniken',
      Category.cider: 'cider',
    };

    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(beverage.title),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: beverage.types.map((type) {
                return Text(type);
              }).toList(),
            ),
            onTap: () {
              showDetails();
            },
          ),
          ...beverage.description.properties.map((entry) {
            String descriptionText = '';
            if (entry.amount != null && entry.remain != null) {
              descriptionText +=
                  ':${categoryMap[entry.category]} for ${entry.remain} ${entry.desc}';
            }
            if (entry.amount == null && entry.remain == null) {
              descriptionText += '${entry.desc}';
            }
            if (entry.degree != null) {
              descriptionText += '${entry.degree}';
            }
            return Row(
              children: [
                // Text(entry.name),
                Icon(categoryIcons[entry.category]),

                Text(descriptionText),
              ],
            );
          }),
          const SizedBox(
            height: 20,
          ),
          ...beverage.salespersons.map((sp) {
            return Text('${sp.name}: ${sp.status}');
          }),
        ],
      ),
    );
  }
}
