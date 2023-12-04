import 'package:flutter/material.dart';

class FooterImage extends StatelessWidget {
  const FooterImage({super.key, this.handleOpenDrawer});

  final void Function()? handleOpenDrawer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 65, 2, 2),
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/background/riimu_logo.png',
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 30,
              child: IconButton(
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Handle filter icon tap
                  handleOpenDrawer?.call();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
