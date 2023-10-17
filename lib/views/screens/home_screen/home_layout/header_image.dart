import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
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
          )),
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
              'Beverages',
              style: GoogleFonts.rubik(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
