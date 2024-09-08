import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/animated_providers.dart';
import 'package:khurumbhi_assignment/Providers/shape_state_provider.dart';

class ColorAnimatedWidget extends ConsumerStatefulWidget {
  const ColorAnimatedWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends ConsumerState<ColorAnimatedWidget>
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
    scaleAnimation = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    //Opacity Animation
    opacityAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(animationController);
  }

  @override
  void didUpdateWidget(covariant ColorAnimatedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    var isClicked = ref.watch(colorsAnimationProvider);
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
    final isClicked = ref.watch(colorsAnimationProvider);
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
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeColor(Colors.amber);
                },
                child: const Icon(
                  size: 30,
                  Icons.circle,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeColor(Colors.blue);
                },
                child: const Icon(
                  size: 30,
                  Icons.circle,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeColor(Colors.green);
                },
                child: const Icon(
                  size: 30,
                  Icons.circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeColor(Colors.red);
                },
                child: const Icon(
                  size: 30,
                  Icons.circle,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeColor(Colors.orange);
                },
                child: const Icon(
                  size: 30,
                  Icons.circle,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeColor(Colors.pink);
                },
                child: const Icon(
                  size: 30,
                  Icons.circle,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
