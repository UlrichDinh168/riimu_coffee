import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/footer_image.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/header_image.dart';

class GenericScreen extends StatefulWidget {
  const GenericScreen({
    super.key,
    required this.title,
    required this.backNavigator,
    required this.imageUrl,
    required this.body,
  });

  final Widget body;
  final String title;
  final bool backNavigator;
  final String imageUrl;

  @override
  State<GenericScreen> createState() => _GenericScreenState();
}

class _GenericScreenState extends State<GenericScreen> {
  // double previousScrollPosition = 0.0;

  final ScrollController _scrollController = ScrollController();

  bool isLoadingPage = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final store = StoreProvider.of<AppState>(context);
    final state = store.state.beveragesState;

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        !state.isLoading &&
        !state.end) {
      setState(() {
        isLoadingPage = true;
      });
      _fetchMoreData();
    }
  }

  void _fetchMoreData() async {
    final store = StoreProvider.of<AppState>(context);
    // previousScrollPosition = _scrollController.position.pixels;

    await fetchBeverages(store);
    // _scrollController.jumpTo(previousScrollPosition);
    setState(() {
      // Loading page
      isLoadingPage = false;
    });
  }

  Widget _buildListView(BeveragesState state) {
    return StoreConnector<AppState, BeveragesState>(
      converter: (store) => store.state.beveragesState,
      builder: (context, beveragesState) {
        return ListView(
          controller: _scrollController,
          children: [
            const HeaderImage(),
            const SizedBox(height: 10.0), // Adjust the header spacing as needed
            ...List.generate(
              state.isLoading
                  ? state.beverages.length + 1
                  : state.beverages.length,
              (index) {
                if (index == state.beverages.length) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final beverage = state.beverages[index];
                  return BeverageCard(
                    beverage: beverage,
                    showDetails: (selectedBeverage) {
                      Store<AppState> store =
                          StoreProvider.of<AppState>(context);
                      store.dispatch(SelectItemAction(selectedBeverage));
                      Navigator.pushNamed(context, '/detail');
                    },
                  );
                }
              },
            ),
            if (isLoadingPage)
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10.0), // Adjust the header spacing as needed
                ],
              ),
          ],
        );
      },
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        // const HeaderImage(),
        Expanded(
          child: StoreConnector<AppState, BeveragesState>(
            converter: (store) => store.state.beveragesState,
            builder: (context, state) {
              return _buildListView(state);
            },
          ),
        ),
        const FooterImage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}
