import 'package:flutter/material.dart';
import 'package:riimu_coffee/views/screens/home_screen/brevages_list_view.dart';
import 'package:riimu_coffee/views/screens/home_screen/generic_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenericScreen(
      title: "brevages",
      backNavigator: false,
      imageUrl:
          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=5070&q=80',
      body: BrevagesListView(),
    );
  }
}
