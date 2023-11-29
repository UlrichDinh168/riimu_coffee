import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  void _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _goBack(context);
      },
      backgroundColor: const Color.fromARGB(255, 253, 233, 236),
      child: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
