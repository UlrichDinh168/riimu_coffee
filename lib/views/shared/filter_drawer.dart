import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/store.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BeveragesState>(
      converter: (store) => store.state.beveragesState,
      builder: (context, beverageState) {
        BeveragesState beveragesState = beverageState;
        List<String> titles = beveragesState.availableTitles;
        final store = StoreProvider.of<AppState>(context);

        void toggleTitleCheckbox(String title, bool? value) {
          store.dispatch(ToggleTitleSelectionAction(title));
        }

        void clearAllSelections() {
          store.dispatch(ClearAllTitleSelectionsAction());
        }

        return Container(
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
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: titles.map((title) {
                      return CheckboxListTile(
                        title: Text(title),
                        value: beveragesState.selectedBeveragesTitles
                            .contains(title),
                        onChanged: (bool? value) {
                          toggleTitleCheckbox(title, value);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              // Clear All Button at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: clearAllSelections,
                  child: const Text(
                    'Clear All',
                    style:
                        TextStyle(color: Colors.red), // Change color as needed
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
