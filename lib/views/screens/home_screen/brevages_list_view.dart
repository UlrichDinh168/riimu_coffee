import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/views/screens/home_screen/beverage_card/beverage_card.dart';

class BrevagesListView extends StatelessWidget {
  const BrevagesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const symmetricPadding = EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    );
    return StoreConnector<AppState, BeveragesState>(
      converter: (store) => store.state.beveragesState,
      builder: (context, beveragesState) {
        return Container(
          padding: symmetricPadding,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                Divider(color: Theme.of(context).dividerColor),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: beveragesState.beverages.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) => BeverageCard(
              beverage: beveragesState.beverages[index],
            ),
          ),
        );
      },
    );
  }
}
