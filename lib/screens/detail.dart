import 'package:flutter/material.dart';
import 'package:riimu_coffee/components/back_button.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() {
    return _DetailsScreenState();
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [BackButtonWidget(), Text('DETAIL')],
      )
          // const BeverageCard(),
          ),
    );
  }
}
