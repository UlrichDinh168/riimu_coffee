import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/controllers/data/beverages.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/detail_screen/detail_screen.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/footer_image.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/header_image.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Beverage> beverages = [];

  final url = Uri.https(
    'run.mocky.io',
    '/v3/775950d3-cd5d-449a-be70-50f8a6f40697/beverages.json',
  );

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<List<Beverage>> _fetchItems() async {
    // void _fetchItem() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      // return Beverage.fromJson(jsonDecode(response.body));
      final List<Beverage> loadedItems =
          jsonList.map((json) => Beverage.fromJson(json)).toList();
      setState(() {
        beverages = loadedItems;
      });
    } else {
      throw Exception('Failed to load album');
    }
    return beverages; // You can also return null here if needed.
  }

  void selectBeverageCategory(BuildContext context, Beverage selectedBeverage) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          selectedBeverage: selectedBeverage,
        ),
      ),
    );
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
                  final beverage = beverages[index];
                  return BeverageCard(
                      beverage: beverage,
                      showDetails: (selectedBeverage) {
                        selectBeverageCategory(context, beverage);
                      });
                },
                childCount: beverages.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: FooterImage())
        ],
      ),
    );
  }
}
