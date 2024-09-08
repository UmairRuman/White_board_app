import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/animated_providers.dart';

class StrokeAnimatedWidget extends ConsumerStatefulWidget {
  const StrokeAnimatedWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends ConsumerState<StrokeAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    //Animation Controller
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    //Slide Animation
    slideAnimation = Tween<Offset>(
      begin: const Offset(-0.9, 0.0),
      end: const Offset(0.1, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    //Scale Animation
    scaleAnimation = Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.bounceInOut));
    //Opacity Animation
    opacityAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(animationController);
  }

  @override
  void didUpdateWidget(covariant StrokeAnimatedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    var isClicked = ref.watch(strokeAnimationProvider);
    log("Did update widget called ");
    if (isClicked) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isClicked = ref.watch(strokeAnimationProvider);
    // Ensure the animation state is correctly set in build method
    if (isClicked) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    return FadeTransition(
      opacity: opacityAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: const Row(
            children: [
              Icon(
                Icons.circle,
                size: 14,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.circle,
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.circle,
                size: 22,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.circle,
                size: 26,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.circle,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
