import 'package:flutter/material.dart';

// class ShipAnimation extends StatefulWidget {
//   const ShipAnimation({super.key, required this.timeout});

//   final int timeout;

//   @override
//   State<StatefulWidget> createState() {
//     return _ShipAnimationState();
//   }
// }

// class _ShipAnimationState extends State<ShipAnimation> {
//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(
//         tween: Tween<double>(begin: 0, end: 4),
//         duration: Duration(seconds: widget.timeout),
//         builder: (_, double translate, __) {
//           return Transform.translate(
//               offset: Offset(translate * 140 - 150, 0),
//               child: Image.asset('assets/images/background/vikingship.png'));
//         });
//   }
// }

class ShipAnimation extends StatelessWidget {
  const ShipAnimation({super.key, required this.timeout});

  final int timeout;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 4),
        duration: Duration(seconds: timeout),
        // translate receive values from tween and move the image
        builder: (_, double translate, __) {
          return Transform.translate(
              // * 50: frames ; +10: each time the image moves
              offset: Offset(translate * 100, 0),
              child: Image.asset('assets/images/background/vikingship.png'));
        });
  }
}
