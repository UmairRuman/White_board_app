import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/shape_state_provider.dart';

class UndoIconWidget extends ConsumerWidget {
  const UndoIconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {
          ref.read(shapeStateProvider.notifier).onUndoClick();
        },
        child: const Icon(Icons.undo));
  }
}
