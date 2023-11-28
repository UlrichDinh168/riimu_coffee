import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/detail_screen/detail_screen.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/footer_image.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/header_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final store = StoreProvider.of<AppState>(context);
    final state = store.state.beveragesState;

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        !state.isLoading &&
        !state.end) {
      // Reach the end of the list, fetch more data
      _fetchMoreData();
    }
  }

  void _fetchMoreData() {
    final store = StoreProvider.of<AppState>(context);
    fetchBeverages(store);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Beverage>>(
      converter: (store) {
        return store.state.beveragesState.beverages;
      },
      builder: (context, beverages) {
        return StoreConnector<AppState, List<Beverage>>(
          converter: (store) => store.state.beveragesState.beverages,
          builder: (context, beverages) {
            return Scaffold(
              body: CustomScrollView(
                controller: _scrollController,
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
      },
    );
  }
}
