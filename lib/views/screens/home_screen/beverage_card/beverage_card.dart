import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riimu_coffee/models/person.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_brewing_time.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_cleaned_date.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_info.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_inventory_items.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_temperature.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_type.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_person.dart';

class BeverageCard extends StatelessWidget {
  const BeverageCard({
    super.key,
    required this.beverage,
    this.showDetails,
    required this.beveragePeopleData,
  });

  final Beverage beverage;
  // final void Function(Beverage beverage) showDetails;
  final Function(Beverage)? showDetails;

  final List<Person> beveragePeopleData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          showDetails?.call(beverage);
        },
        splashColor: const Color.fromARGB(255, 250, 188, 198),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 250, 188, 198),
                // Colors.red[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(1, 1),
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
                  BeverageType(beverageTypes: beverage.labels),
                  const SizedBox(height: 5),
                  // BeverageDescription(
                  //     beverageDescriptions: beverage.info,
                  //     title: beverage.title),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // SalespersonInfo(salespersons: beverage.salespersons)
                  beverage.info != ''
                      ? BeverageInfo(info: beverage.info)
                      : const SizedBox(),
                  if (beverage.temperature != '')
                    BeverageTemperature(temperature: beverage.temperature),
                  BeverageInventoryItems(
                    inventoryItems: beverage.inventoryItems,
                  ),
                  if (beverage.minutesFromBrewing != '')
                    BeverageBrewingTime(minutes: beverage.minutesFromBrewing),
                  if (beverage.dateCleaned != '')
                    BeverageCleaningDate(cleaningDate: beverage.dateCleaned),
                  BeveragePersonInfo(persons: beveragePeopleData),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
