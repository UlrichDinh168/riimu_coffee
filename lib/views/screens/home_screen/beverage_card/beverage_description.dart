// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:riimu_coffee/models/legacy/beverage_legacy.dart';

// class BeverageDescription extends StatelessWidget {
//   BeverageDescription(
//       {super.key, required this.beverageDescriptions, required this.title});

//   final Beverage beverage;
//   // final Description beverageDescriptions;
//   final String title;

//   final categoryMap = {
//     Category.water: 'water',
//     Category.time: 'time',
//     Category.app: 'app',
//     Category.info: 'info',
//     Category.cup: 'cup',
//     Category.degree: 'degree',

//     Category.bean: 'bean',
//     Category.clean: 'clean',
//     //
//     Category.coke: 'coke',
//     Category.beer: 'beer',
//     Category.sting: 'sting',
//     Category.heiniken: 'heiniken',
//     Category.cider: 'cider',
//   };

//   double normalizePercentage(double value) {
//     double clampedValue = value.clamp(0.0, 100);
//     // clampedValue /= 100.0;
//     return clampedValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: ValueKey(beverage.id),
//       width: double.infinity,
//       margin: const EdgeInsets.only(bottom: 10),
//       child: InkWell(
//         onTap: () {
//           if (selectedBeverageArray.isEmpty) {
//             ref
//                 .read(selectedBeverageProvider.notifier)
//                 .setSelectedBeverage(beverage);
//             _handleNavigateToItemScreen(context, beverage);
//           }
//         },
//         borderRadius: BorderRadius.circular(15),
//         child: Card(
//           elevation: 2,
//           color: Theme.of(context).colorScheme.onBackground,
//           child: Padding(
//             padding: symmetricPadding,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   beverage.title,
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Theme.of(context).colorScheme.onPrimary,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 BeverageLabelList(labels: beverage.labels),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 beverage.info != ''
//                     ? BeverageInfo(info: beverage.info)
//                     : const SizedBox(),
//                 if (beverage.temperature != '')
//                   BeverageTemperature(temperature: beverage.temperature),
//                 BeverageInventoryItems(
//                   inventoryItems: beverage.inventoryItems,
//                 ),
//                 if (beverage.minutesFromBrewing != '')
//                   BeverageBrewingTime(minutes: beverage.minutesFromBrewing),
//                 if (beverage.dateCleaned != '')
//                   BeverageCleaningDate(cleaningDate: beverage.dateCleaned),
//                 BeveragePersonChips(personChips: beveragePeopleData),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//     // return Column(
//       children: [
//         ...beverageDescriptions.properties.map((entry) {
//           String descriptionText = '';
//           double materialPercentage =
//               normalizePercentage((entry.remain ?? 1) / (entry.total ?? 100));

//           double degreePercentage =
//               normalizePercentage((entry.degree ?? 1) / 100.0);

//           String text = title != 'Cold beverages' ? ' for' : '';

//           if (entry.total != null && entry.remain != null) {
//             descriptionText +=
//                 '$text ${entry.remain} ${categoryMap[entry.category]} ${entry.desc}';
//           }
//           if (entry.degree != null) {
//             descriptionText += ' ${entry.degree} ';
//           }
//           if (entry.total == null && entry.remain == null) {
//             descriptionText += '${entry.desc}';
//           }

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 8.0),
//                     child: Icon(categoryIcons[entry.category]),
//                   ),
//                   if (entry.total != null && entry.remain != null ||
//                       entry.degree != null)
//                     Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: LinearPercentIndicator(
//                         padding: const EdgeInsets.symmetric(horizontal: 0),
//                         width: 100.0,
//                         lineHeight: 5.0,
//                         barRadius: const Radius.circular(10),
//                         percent: entry.degree != null
//                             ? degreePercentage
//                             : materialPercentage,
//                         backgroundColor: Colors.black54,
//                         progressColor: Colors.red,
//                       ),
//                     ),
//                   Text(descriptionText),
//                 ],
//               ),
//             ],
//           );
//         }),
//       ];,
//     );
//   }
// }
