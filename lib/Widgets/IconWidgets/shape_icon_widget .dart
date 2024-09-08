import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/animated_providers.dart';
import 'package:khurumbhi_assignment/Widgets/AnimatedWidgets/shape_animated_widget.dart';

class ShapeIconWidget extends ConsumerWidget {
  const ShapeIconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(children: [
      InkWell(
        onTap: () {
          ref.read(shapeAnimationProvider.notifier).onShapeIconClick();
        },
        child: const Icon(Icons.square_outlined),
      ),
      const ShapeAnimatedWidget(),
    ]);
  }
}
