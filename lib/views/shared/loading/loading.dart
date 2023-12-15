import 'package:flutter/material.dart';
import 'package:riimu_coffee/views/shared/loading/loading_container.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({
    super.key,
  });

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return const LoadingContainer();
  }
}
