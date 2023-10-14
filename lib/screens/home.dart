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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        width: 40,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red[50],
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
            child: Image.asset(
              'assets/images/background/coffees.png',
              fit: BoxFit.cover,
            ), // Your image
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final beverage = beverages[index];
                  return BeverageCard(
                      beverage: beverage, showDetails: showDetails);
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
                'assets/images/background/riimu-logo.png',
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
