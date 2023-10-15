import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class BeverageCard extends StatelessWidget {
  const BeverageCard({
    Key? key,
    required this.beverage,
    required this.showDetails,
  }) : super(key: key);

  final Beverage beverage;
  final void Function(Beverage beverage) showDetails;

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
    // print(beverage.id);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          showDetails(beverage);
        },
        splashColor: const Color.fromARGB(255, 250, 188, 198),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Container(
            padding: const EdgeInsets.only(
                bottom: 10.0), // Adjust the bottom padding value as needed
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 250, 188, 198),
                // Colors.red[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Shadow color
                    spreadRadius: 0, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(1, 1), // Offset from the bott
                  )
                ]),

            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beverage.title,
                    style: GoogleFonts.rubik(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: beverage.types.map((type) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal:
                                  10), // Adjust the padding values as needed
                          decoration: BoxDecoration(
                            color: Colors.green[300], // Background color
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the radius value as needed
                          ),
                          child: Text(
                            type,
                            style: const TextStyle(
                                color: Colors
                                    .white), // Adjust the text style as needed
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 5),
                  ...beverage.description.properties.map((entry) {
                    String descriptionText = '';
                    double materialPercentage = clampAndNormalizePercentage(
                        (entry.remain ?? 1) / (entry.total ?? 100));

                    double degreePercentage = clampAndNormalizePercentage(
                        (entry.degree ?? 1) / 100.0);

                    String text =
                        beverage.title != 'Cold beverages' ? ' for' : '';

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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ...beverage.salespersons.map((sp) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/team/${sp.name[0].toLowerCase() + sp.name.substring(1)}.jpg'),
                                radius: 20.0, // Adjust the radius as needed
                              ),
                              const SizedBox(
                                  width:
                                      5.0), // Add spacing between profile picture and text
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
