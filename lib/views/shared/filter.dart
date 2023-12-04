import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/store.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({
    Key? key,
  }) : super(key: key);

  @override
  createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  // List<String> selectedBeveragesTitles = [];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BeveragesState>(
      converter: (store) => store.state.beveragesState,
      builder: (context, beverageState) {
        // final List<Widget> beveragesCheckboxes = [];

        BeveragesState beveragesState = beverageState;
        List<String> titles = beveragesState.availableTitles;

        print(titles);

        void _toggleTitleCheckbox(String title, bool? value) {
          final store = StoreProvider.of<AppState>(context);
          store.dispatch(ToggleTitleSelectionAction(title));
        }

        return Container(
          alignment: Alignment.topLeft,
          height: 400,
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Select beverages to display',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
              Column(
                children: titles.map((title) {
                  return CheckboxListTile(
                    title: Text(title),
                    value:
                        beveragesState.selectedBeveragesTitles.contains(title),
                    onChanged: (bool? value) {
                      _toggleTitleCheckbox(title, value);
                    },
                  );
                }).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}
