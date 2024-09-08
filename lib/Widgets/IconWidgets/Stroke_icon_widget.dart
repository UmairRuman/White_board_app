import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/animated_providers.dart';
import 'package:khurumbhi_assignment/Widgets/AnimatedWidgets/stroke_animated_widget.dart';

class StrokeIconWidget extends ConsumerWidget {
  const StrokeIconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      InkWell(
        onTap: () {
          ref.read(strokeAnimationProvider.notifier).onStrokeIconClick();
        },
        child: const Icon(Icons.circle_outlined),
      ),
      const StrokeAnimatedWidget(),
    ]);
  }
}
