import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BeverageDescription extends StatelessWidget {
  BeverageDescription(
      {super.key, required this.beverageDescriptions, required this.title});

  final Description beverageDescriptions;
  final String title;

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

  double normalizePercentage(double value) {
    double clampedValue = value.clamp(0.0, 100);
    // clampedValue /= 100.0;
    return clampedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...beverageDescriptions.properties.map((entry) {
          String descriptionText = '';
          double materialPercentage =
              normalizePercentage((entry.remain ?? 1) / (entry.total ?? 100));

          double degreePercentage =
              normalizePercentage((entry.degree ?? 1) / 100.0);

          String text = title != 'Cold beverages' ? ' for' : '';

          if (entry.total != null && entry.remain != null) {
            descriptionText +=
                '$text ${entry.remain} ${categoryMap[entry.category]} ${entry.desc}';
          }
          if (entry.degree != null) {
            descriptionText += ' ${entry.degree} ';
          }
          if (entry.total == null && entry.remain == null) {
            descriptionText += '${entry.desc}';
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(categoryIcons[entry.category]),
                  ),
                  if (entry.total != null && entry.remain != null ||
                      entry.degree != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: LinearPercentIndicator(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        width: 100.0,
                        lineHeight: 5.0,
                        barRadius: const Radius.circular(10),
                        percent: entry.degree != null
                            ? degreePercentage
                            : materialPercentage,
                        backgroundColor: Colors.black54,
                        progressColor: Colors.red,
                      ),
                    ),
                  Text(descriptionText),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}
