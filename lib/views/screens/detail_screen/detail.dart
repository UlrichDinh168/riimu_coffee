import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/detail_screen/beverage_availability/beverage_availability.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.selectedBeverage});

  final Beverage selectedBeverage;

  void _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        width: 40,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            _goBack(context);
          },
          backgroundColor: const Color.fromARGB(255, 253, 233, 236),
          // Colors.red[50],
          child: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background/${selectedBeverage.themeImage}.png',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.srcOver,
                  ),
                )),
              ),
              Positioned(
                top: 30, // Adjust to your desired position from the top
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
                      selectedBeverage.title,
                      style: GoogleFonts.rubik(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ]),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 30),
            sliver: SliverToBoxAdapter(
              child: BeverageCard(
                beverage: selectedBeverage,
                showDetails: (selectedBeverage) {},
              ),
            ),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              sliver: SliverToBoxAdapter(
                  child: BeverageItem(selectedBeverage: selectedBeverage))),
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
