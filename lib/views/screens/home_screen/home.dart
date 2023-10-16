import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/controllers/data/beverages.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/detail_screen/detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  void _selectBeverageCategory(
      BuildContext context, Beverage selectedBeverage) {
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
          SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage(
                      'assets/images/background/coffees.png',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.25),
                      BlendMode.srcOver,
                    ),
                  )),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/background/riimu_logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50,
                  child: Center(
                    child: Text(
                      'Beverages',
                      style: GoogleFonts.rubik(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 30),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final beverage = beverages[index];
                  return BeverageCard(
                      beverage: beverage,
                      showDetails: (selectedBeverage) {
                        _selectBeverageCategory(context, beverage);
                      });
                },
                childCount: beverages.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color.fromARGB(255, 65, 2, 2),
              height: 70,
              child: Image.asset(
                'assets/images/background/riimu_logo.png',
                width: 10,
                height: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
