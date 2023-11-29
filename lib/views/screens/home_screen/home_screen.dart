import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/people/people_state.dart';
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

  void _adjustScrollPosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _fetchMoreData() async {
    final store = StoreProvider.of<AppState>(context);
    await fetchBeverages(store);
    _adjustScrollPosition;
  }

  // Widget build(BuildContext context) {
  //   return StoreConnector<AppState, BeveragesState>(
  //     converter: (store) => store.state.beveragesState,
  //     builder: (context, state) {
  //       // if (_scrollController.hasClients) {
  //       //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  //       // }
  //             // final peopleData = store.state.peopleState.people;

  //       return Scaffold(
  //         body: CustomScrollView(
  //           controller: _scrollController,
  //           slivers: <Widget>[
  //             const SliverToBoxAdapter(child: HeaderImage()),
  //             SliverPadding(
  //               padding: const EdgeInsets.only(top: 30),
  //               sliver: SliverList(
  //                 delegate: SliverChildBuilderDelegate(
  //                   (BuildContext context, int index) {
  //                     // Adjusted this line to use 'state.beverages' instead of 'beverages'
  //                     final beverage = state.beverages[index];
  //                     // final people = state.pe[index];
  //                     return BeverageCard(
  //                       beverage: beverage,
  //                       beveragePeopleData: [], // You may need to replace this with actual data
  //                     );
  //                   },
  //                   // Adjusted this line to use 'state.beverages.length' instead of 'beverages.length'
  //                   childCount: state.isLoading
  //                       ? state.beverages.length + 1
  //                       : state.beverages.length,
  //                 ),
  //               ),
  //             ),
  //             if (state.isLoading)
  //               const SliverToBoxAdapter(
  //                 child: Center(
  //                   child: CircularProgressIndicator(),
  //                 ),
  //               ),
  //             const SliverToBoxAdapter(child: FooterImage())
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  void _handleNavigateToItemScreen(BuildContext context, Beverage beverage) {
    Navigator.of(context).pushNamed('/details');
  }

  final symmetricPadding = const EdgeInsets.symmetric(
    vertical: 0,
    horizontal: 10,
  );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BeveragesState>(
      converter: (store) => store.state.beveragesState,
      builder: (context, state) {
        return StoreConnector<AppState, PeopleState>(
          converter: (store) => store.state.peopleState,
          builder: (context, peopleState) {
            // final peopleData = peopleState.people;

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
                        final beverage = state.beverages[index];
                        // final people = peopleData[index]; // Assuming people and beverages have corresponding indexes
                        return BeverageCard(
                          beverage: beverage,
                          beveragePeopleData: const [],
                          showDetails: (selectedBeverage) {
                            Store<AppState> store =
                                StoreProvider.of<AppState>(context);

                            // Dispatch an action to update the selected beverage in the store
                            store.dispatch(SelectItemAction(selectedBeverage));

                            // Navigate to the /details screen
                            Navigator.pushNamed(context, '/detail');
                          },
                          // _handleNavigateToItemScreen(context, beverage),
                        );
                      },
                      childCount: state.isLoading
                          ? state.beverages.length + 1
                          : state.beverages.length,
                    ),
                  ),
                ),
                if (state.isLoading)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                const SliverToBoxAdapter(child: FooterImage())
              ],
            ));
          },
        );
      },
    );
  }
}
