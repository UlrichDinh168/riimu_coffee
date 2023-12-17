import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riimu_coffee/redux/language/language_state.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/redux/theme/theme_actions.dart';
import 'package:riimu_coffee/redux/theme/theme_state.dart';
import 'package:riimu_coffee/views/shared/translation.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    super.key,
    this.handleOpenBeverageFilter,
    this.handleOpenLanguageSelection,
  });

  final void Function()? handleOpenBeverageFilter;
  final void Function()? handleOpenLanguageSelection;

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    void toggleThemeChange(String themeMode) {
      setOrChangeTheme(store, themeMode);
    }

    return StoreConnector<AppState, LanguageState>(
      converter: (store) => store.state.languageState,
      builder: (context, languageState) {
        return Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                    'assets/images/background/coffees.png',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25),
                    BlendMode.srcOver,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/background/riimu_logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 50,
              child: Center(
                child: Text(
                  AppLocale.beverages.getString(context),
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.language_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      handleOpenLanguageSelection?.call();
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      handleOpenBeverageFilter?.call();
                    },
                  ),
                ],
              ),
            ),
            StoreConnector<AppState, ThemeState>(
              converter: (store) => store.state.themeState,
              builder: (context, themeState) {
                return Positioned(
                  top: 50,
                  left: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: themeState.themeMode == 'light'
                            ? const Icon(
                                Icons.light_mode_outlined,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.dark_mode_outlined,
                                color: Colors.white,
                              ),
                        onPressed: () {
                          // Toggle between 'light' and 'dark' modes
                          String newThemeMode = themeState.themeMode == 'light'
                              ? 'dark'
                              : 'light';
                          toggleThemeChange(newThemeMode);
                        },
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
