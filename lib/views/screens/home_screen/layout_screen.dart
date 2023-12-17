import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_layout/header_image.dart';
import 'package:riimu_coffee/views/shared/filter_drawer.dart';
import 'package:riimu_coffee/views/shared/language_selection.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({
    super.key,
  });

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
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
      isLoadingPage = false;
    });
  }

  void onOpenBeverageFilter() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const FilterDrawer();
      },
    );
  }

  void onOpenLanguageSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const LanguageSelectionWidget();
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

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  HeaderImage(
                    handleOpenBeverageFilter: onOpenBeverageFilter,
                    handleOpenLanguageSelection: onOpenLanguageSelection,
                  ),
                  const SizedBox(height: 20),
                  ...filteredBeverages.map(
                    (beverage) => LayoutBuilder(
                      builder: (context, constraints) {
                        return BeverageCard(
                          beverage: beverage,
                          showDetails: (selectedBeverage) {
                            Store<AppState> store =
                                StoreProvider.of<AppState>(context);
                            store.dispatch(SelectItemAction(selectedBeverage));
                            Navigator.pushNamed(context, '/detail');
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (isLoadingPage)
          Positioned.fill(
              child: Container(
            color: Colors.black
                .withOpacity(0.1), // Adjust opacity and color as needed
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ))
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
      // bottomNavigationBar: FooterImage(
      //     handleOpenBeverageFilter: onOpenBeverageFilter,
      //     handleOpenLanguageSelection: onOpenLanguageSelection),
      body: _buildBody(),
    );
  }
}
