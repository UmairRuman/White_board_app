import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/pen_state_provider.dart';

class PenIconWidget extends ConsumerWidget {
  const PenIconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isClicked = ref.watch(penIconProvider);

    return InkWell(
        onTap: () {
          ref.read(penIconProvider.notifier).onPenClick();
        },
        child: AnimatedCrossFade(
            firstChild: const Icon(Icons.mode_edit_outlined),
            secondChild: const Icon(
              Icons.mode_edit,
              color: Colors.blue,
              size: 27,
            ),
            crossFadeState: isClicked == false
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 500)));
  }
}
