import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/animated_providers.dart';
import 'package:khurumbhi_assignment/Widgets/AnimatedWidgets/arrow_animated_widget.dart';

class ArrowIconWidget extends ConsumerWidget {
  const ArrowIconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(children: [
      InkWell(
        onTap: () {
          ref.read(arrowAnimationProvider.notifier).onArrowIconClick();
        },
        child: const Icon(Icons.arrow_forward),
      ),
      const ArrowAnimatedWidget(),
    ]);
  }
}
