import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/detail_screen/beverage_availability/beverage_extra_info.dart';

class BeverageItem extends StatelessWidget {
  const BeverageItem({
    Key? key,
    required this.selectedBeverage,
    // required this.showDetails,
  }) : super(key: key);

  final Beverage selectedBeverage;
  // final void Function(Beverage beverage) showDetails;

  @override
  Widget build(BuildContext context) {
    // print(selectedBeverage.id);
    return InkWell(
      onTap: () {},
      splashColor: Colors.green[100],
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(1, 1),
                )
              ]),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: BeverageExtraInfo(
                  extraInfo: selectedBeverage.beverageItem,
                  material: selectedBeverage.material)),
        ),
      ),
    );
  }
}
