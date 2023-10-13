import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BeverageCard extends StatelessWidget {
  const BeverageCard({
    Key? key,
    required this.beverage,
    required this.showDetails,
  }) : super(key: key);

  final Beverage beverage;
  final void Function() showDetails;

  double clampAndNormalizePercentage(double value) {
    double clampedValue = value.clamp(0.0, 100);
    // clampedValue /= 100.0;
    return clampedValue;
  }

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
    print(beverage.id);
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
            // double materialPercentage =
            //     (entry.remain ?? 1 / (entry.total ?? 100));
            // materialPercentage = materialPercentage.clamp(0.0,
            //     100.0); // Ensure the percentage is within the valid range
            // materialPercentage /= 100.0; // Convert to the 0.0 to 1.0 range

            // double barPercentage = entry.degree != null
            //     ? (entry.degree ?? 1 / 100.0)
            //     : materialPercentage;

            double materialPercentage = clampAndNormalizePercentage(
                (entry.remain ?? 1) / (entry.total ?? 100));

            double degreePercentage =
                clampAndNormalizePercentage((entry.degree ?? 1) / 100.0);

            // double barPercentage = entry.degree != null
            //     ? clampAndNormalizePercentage(degreePercentage, 0.0, 100.0)
            //     : clampAndNormalizePercentage(materialPercentage, 0.0, 100.0);

            String text = beverage.title != 'Cold beverages' ? 'for' : '';

            if (entry.total != null && entry.remain != null) {
              descriptionText +=
                  '${categoryMap[entry.category]} $text ${entry.remain} ${entry.desc}';
            }
            if (entry.total == null && entry.remain == null) {
              descriptionText += '${entry.desc}';
            }
            if (entry.degree != null) {
              descriptionText += '${entry.degree}';
            }
            return Row(
              children: [
                // Text(entry.name),
                Icon(categoryIcons[entry.category]),
                if (entry.total != null && entry.remain != null ||
                    entry.degree != null)
                  LinearPercentIndicator(
                    width: 140.0,
                    lineHeight: 5.0,
                    barRadius: const Radius.circular(10),
                    percent: entry.degree != null
                        ? degreePercentage
                        : materialPercentage,
                    backgroundColor: Colors.black12,
                    progressColor: Colors.red,
                  ),

                // ProgressBar(progress: entry.remain),

                Text(descriptionText),
              ],
            );
          }),
          // const ProgressBar(),

          const SizedBox(
            height: 20,
          ),
          ...beverage.salespersons.map((sp) {
            return Row(
              children: [
                Column(
                  children: [
                    Text(sp.name),
                    Text(sp.status),
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
