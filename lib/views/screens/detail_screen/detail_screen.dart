import 'package:flutter/material.dart';
import 'package:riimu_coffee/views/screens/detail_screen/beverage_availability/beverage_consumption.dart';
import 'package:riimu_coffee/views/screens/detail_screen/beverage_availability/detail_screen_top.dart';
import 'package:riimu_coffee/views/screens/detail_screen/beverage_availability/beverage_availability_card.dart';
import 'package:riimu_coffee/views/screens/detail_screen/go_back_button.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/footer_image.dart';

class DetailScreen extends StatelessWidget {
  final Beverage selectedBeverage;

  const DetailScreen({super.key, required this.selectedBeverage});

  @override
  Widget build(BuildContext context) {
    print(selectedBeverage.availableItems);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const SizedBox(
        width: 40,
        height: 40,
        child: GoBackButton(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: DetailScreenTop(selectedBeverage: selectedBeverage),
          ),
          _buildBeverageDetailsSection(),
          const SliverToBoxAdapter(child: FooterImage()),
        ],
      ),
    );
  }

// deatil screen components
  SliverPadding _buildBeverageDetailsSection() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            BeverageCard(
              beveragePeopleData: const [],
              beverage: selectedBeverage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BeverageAvailabilityCard(
                beverage: selectedBeverage,
                symmetricPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
              ),
            ),
            if (selectedBeverage.availableItems.isNotEmpty &&
                selectedBeverage.availableItems
                    .every((item) => item.weekConsuption.isNotEmpty))
              BeverageConsumption(
                beverageAvailableItems: selectedBeverage.availableItems,
              ),
          ],
        ),
      ),
    );
  }
}
