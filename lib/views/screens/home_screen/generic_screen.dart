import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/footer_image.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/header_image.dart';
import 'package:riimu_coffee/views/shared/filter.dart';

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
        !state.end &&
        state.selectedBeveragesTitles.isEmpty) {
      setState(() {
        isLoadingPage = true;
      });
      _fetchMoreData();
    }
  }

  void _fetchMoreData() async {
    final store = StoreProvider.of<AppState>(context);

    await fetchBeverages(store);
    setState(() {
      // Loading page
      isLoadingPage = false;
    });
  }

  void onOpenDrawer() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const FilterDrawer();
      },
    );
  }

  Widget _buildListView(BeveragesState state) {
    List<String>? selectedTitles = state.selectedBeveragesTitles;

    List<Beverage> filteredBeverages = selectedTitles.isNotEmpty == true
        ? state.beverages
            .where((beverage) => selectedTitles.contains(beverage.title))
            .toList()
        : List.from(state.beverages);

    return ListView(
      controller: _scrollController,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        const HeaderImage(),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(height: 20),
        ...filteredBeverages.map((beverage) => LayoutBuilder(
              builder: (context, constraints) {
                return BeverageCard(
                  beverage: beverage,
                  showDetails: (selectedBeverage) {
                    Store<AppState> store = StoreProvider.of<AppState>(context);
                    store.dispatch(SelectItemAction(selectedBeverage));
                    Navigator.pushNamed(context, '/detail');
                  },
                );
              },
            )),
        if (isLoadingPage)
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: StoreConnector<AppState, BeveragesState>(
            converter: (store) => store.state.beveragesState,
            builder: (context, state) {
              return _buildListView(state);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: FooterImage(
        handleOpenDrawer: onOpenDrawer,
      ),
      body: _buildBody(),
    );
  }
}
