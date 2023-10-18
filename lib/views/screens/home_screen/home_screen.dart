import 'package:flutter/material.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/detail_screen/detail_screen.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/footer_image.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/header_image.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.beverages});

  final List<Beverage> beverages;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BeverageSingleItem> inventoryItems = [];

  void selectBeverageCategory(BuildContext context, Beverage selectedBeverage) {
    // _fetchInventory();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          selectedBeverage: selectedBeverage,
        ),
      ),
    );
  }

  final url = Uri.https(
    'run.mocky.io',
    '/v3/681ec46b-08ce-4a23-bd98-81fd98c41328',
  );
// https://run.mocky.io/v3/5b8efbd6-903d-420e-b942-5fc393d55256

  Future<List<BeverageSingleItem>> _fetchInventory() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      final List<BeverageSingleItem> loadedItems =
          jsonList.map((json) => BeverageSingleItem.fromJson(json)).toList();

      if (mounted) {
        // check whether the state object is in tree
        setState(() {
          inventoryItems = loadedItems;
        });
      }
    } else {
      throw Exception('Failed to load album');
    }
    return inventoryItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(child: HeaderImage()),
          SliverPadding(
            padding: const EdgeInsets.only(top: 30),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final beverage = widget.beverages[index];
                  return BeverageCard(
                      beverage: beverage,
                      showDetails: (selectedBeverage) {
                        selectBeverageCategory(context, beverage);
                      });
                },
                childCount: widget.beverages.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: FooterImage())
        ],
      ),
    );
  }
}
