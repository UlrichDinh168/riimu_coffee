import 'package:flutter/material.dart';
import 'package:riimu_coffee/components/beverage_card.dart';
import 'package:riimu_coffee/data/beverages.dart';

// class Home extends StatefulWidget {
//   const Home({super.key, required this.showDetails});

//   final void Function(String answer) showDetails;

//   @override
//   State<Home> createState() {
//     return _HomeState();
//   }
// }

// class _HomeState extends State<Home> {
class Home extends StatelessWidget {
  const Home({super.key, required this.showDetails});
  final void Function() showDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purpleAccent, Color.fromARGB(255, 88, 88, 88)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: ListView.builder(
          itemCount: beverages.length,
          itemBuilder: (context, index) {
            final beverage = beverages[index];

            return BeverageCard(beverage: beverage, showDetails: showDetails);
          },
        ));
  }
}
