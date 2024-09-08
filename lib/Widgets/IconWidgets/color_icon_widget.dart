import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/animated_providers.dart';
import 'package:khurumbhi_assignment/Widgets/AnimatedWidgets/color_animated_widget.dart';

class ColorIconWidget extends ConsumerWidget {
  const ColorIconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(children: [
      InkWell(
        onTap: () {
          ref.read(colorsAnimationProvider.notifier).onColorIconClick();
        },
        child: const Icon(Icons.color_lens_outlined),
      ),
      const ColorAnimatedWidget(),
    ]);
  }
}