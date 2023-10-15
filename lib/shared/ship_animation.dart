import 'package:flutter/material.dart';

class MyAnimationScreen extends StatefulWidget {
  const MyAnimationScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyAnimationScreenState();
  }
}

class _MyAnimationScreenState extends State<MyAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0, // Adjust to your desired position from the top
      left: 0,
      right: 0,
      bottom: 30,
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation
                  .value, // Scale the image based on the animation value
              child: Image.asset('assets/images/background/vikingship.png'),
            );
          },
        ),
      ),
    );
  }
}
