import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riimu_coffee/models/beverage.dart';

class DetailScreenTop extends StatelessWidget {
  final Beverage selectedBeverage;

  const DetailScreenTop({super.key, required this.selectedBeverage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(selectedBeverage.imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30, // Adjust to your desired position from the top
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
                selectedBeverage.title,
                style: GoogleFonts.rubik(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
