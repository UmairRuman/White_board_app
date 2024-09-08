import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Enum.dart';
import 'package:khurumbhi_assignment/Providers/animated_providers.dart';
import 'package:khurumbhi_assignment/Providers/shape_state_provider.dart';

class ShapeAnimatedWidget extends ConsumerStatefulWidget {
  const ShapeAnimatedWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends ConsumerState<ShapeAnimatedWidget>
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
  void didUpdateWidget(covariant ShapeAnimatedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    var isClicked = ref.watch(shapeAnimationProvider);
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
    final isClicked = ref.watch(shapeAnimationProvider);
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
                      .setShapeType(ShapeType.circle);
                },
                child: const Icon(
                  CupertinoIcons.circle,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeType(ShapeType.triangle);
                },
                child: const Icon(
                  CupertinoIcons.triangle,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeType(ShapeType.hexagon);
                },
                child: const Icon(
                  CupertinoIcons.hexagon,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeType(ShapeType.rectangle);
                },
                child: const Icon(
                  CupertinoIcons.rectangle,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(shapeStateProvider.notifier)
                      .setShapeType(ShapeType.pentagon);
                },
                child: const Icon(
                  Icons.pentagon_outlined,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
