import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/color_state_provider.dart';
import 'package:khurumbhi_assignment/Providers/pen_state_provider.dart';
import 'package:khurumbhi_assignment/Widgets/Painterwidgets/PenPainter/pen_painter_widget.dart';

class PenCanvasWidget extends ConsumerWidget {
  const PenCanvasWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isClickedOnPen = ref.watch(penIconProvider);
    Color paintColor = ref.watch(colorStateProvider);
    var points = ref.watch(penStateProvider);
    return GestureDetector(
        //On Pan Start means when the user firstly touch the screen
        onPanStart: (details) {
          if (isClickedOnPen) {
            ref.read(penStateProvider.notifier).onPanStart(details, context);
          }
        },
        //This method will call as long as the user dragging on screen
        onPanUpdate: (details) {
          if (isClickedOnPen) {
            ref.read(penStateProvider.notifier).onPanUpdate(details, context);
          }
        },
        child: CustomPaint(
            size: Size.infinite,
            painter: PenPainterWidget(
              paintColor: paintColor,
              isClikedOnPen: isClickedOnPen,
              points: points,
            ),
            child: Container()));
  }
}
