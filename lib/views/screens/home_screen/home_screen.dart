import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:riimu_coffee/models/inventory_items.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/detail_screen/detail_screen.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/footer_image.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/header_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Beverage>>(
      converter: (store) {
        return store.state.beveragesState.beverages;
      },
      builder: (context, beverages) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(child: HeaderImage()),
              SliverPadding(
                padding: const EdgeInsets.only(top: 30),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final beverage = beverages[index];
                      return BeverageCard(
                        beverage: beverage,
                        beveragePeopleData: const [], // You may need to replace this with actual data
                        // showDetails: (selectedBeverage) {
                        //   selectBeverageCategory(context, beverage);
                        // },
                      );
                    },
                    childCount: beverages.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: FooterImage())
            ],
          ),
        );
      },
    );
  }
}
