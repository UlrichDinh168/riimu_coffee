import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:riimu_coffee/views/shared/loading/ship_animation.dart';
import 'package:riimu_coffee/views/shared/translation.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onBackground,
      child: Stack(children: [
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              'assets/images/background/riimu_logo_2.png',
              width: 100,
              height: 100,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: LinearPercentIndicator(
                // width: 150,
                animation: true,
                lineHeight: 10.0,
                animationDuration: ((10 * 1000).toInt()),
                barRadius: const Radius.circular(10),
                percent: 1,
                backgroundColor: Colors.black,
                progressColor: Colors.red[700],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocale.loading.getString(context),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 30.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        const Positioned(
            bottom: 0,
            child: ShipAnimation(
              timeout: 10,
            )),
        Positioned(
          left: 20,
          bottom: 0,
          child: Center(
            child: Image.asset(
              'assets/images/background/waves.png',
            ),
          ),
        ),
      ]),
    );
  }
}
