import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/pen_state_provider.dart';

class RedoIconWidget extends ConsumerWidget {
  const RedoIconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {
          ref.read(penStateProvider.notifier).onRedo();
        },
        child: const Icon(Icons.redo_outlined));
  }
}
