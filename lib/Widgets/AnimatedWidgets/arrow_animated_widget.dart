import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/animated_providers.dart';

class ArrowAnimatedWidget extends ConsumerStatefulWidget {
  const ArrowAnimatedWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends ConsumerState<ArrowAnimatedWidget>
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
  void didUpdateWidget(covariant ArrowAnimatedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    var isClicked = ref.watch(arrowAnimationProvider);
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
    final isClicked = ref.watch(arrowAnimationProvider);
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
                Icons.arrow_back,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_downward,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_upward,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
