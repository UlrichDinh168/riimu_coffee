import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:riimu_coffee/redux/language/language_actions.dart';
import 'package:riimu_coffee/redux/language/language_state.dart';
import 'package:riimu_coffee/redux/store.dart';

class LanguageSelectionWidget extends StatefulWidget {
  const LanguageSelectionWidget({super.key});

  @override
  createState() => _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  final _dropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;
    return StoreConnector<AppState, LanguageState>(
      converter: (store) => store.state.languageState,
      builder: (context, languageState) {
        return Container(
          height: 200,
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Current Language',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                key: _dropdownKey,
                value: languageState.languageCode,
                onChanged: (String? newLanguageCode) {
                  if (newLanguageCode != null) {
                    StoreProvider.of<AppState>(context)
                        .dispatch(ChangeLanguageAction(newLanguageCode));
                    localization.translate(newLanguageCode);

                    // Close the dropdown programmatically
                    Navigator.of(_dropdownKey.currentContext!).pop();
                  }
                },
                items:
                    localization.supportedLocales.map<DropdownMenuItem<String>>(
                  (Locale locale) {
                    return DropdownMenuItem<String>(
                      value: locale.languageCode,
                      child: Text(locale.languageCode.toUpperCase()),
                    );
                  },
                ).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}
