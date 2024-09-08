import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Providers/animated_providers.dart';
import 'package:khurumbhi_assignment/Providers/pen_state_provider.dart';
import 'package:khurumbhi_assignment/Providers/shape_state_provider.dart';
import 'package:khurumbhi_assignment/Widgets/Painterwidgets/ShapePainterWidget/ShapeWidgets/circleShape.dart';

class ShapeCanvasWidget extends ConsumerWidget {
  const ShapeCanvasWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var shapes = ref.watch(shapeStateProvider);
    var isClickOnPen = ref.watch(penIconProvider);
    var isClickOnShape = ref.watch(shapeAnimationProvider);
    var points = ref.watch(penStateProvider);
    return GestureDetector(
      onPanStart: (details) {
        if (!isClickOnPen) {
          if (isClickOnShape) {
            ref.read(shapeStateProvider.notifier).onPanStart(details, context);
          }
        } else {
          ref.read(penStateProvider.notifier).onPanStart(details, context);
        }
      },
      onPanUpdate: (details) {
        if (!isClickOnPen) {
          if (isClickOnShape) {
            ref.read(shapeStateProvider.notifier).onPanUpdate(details, context);
          }
        } else {
          ref.read(penStateProvider.notifier).onPanUpdate(details, context);
        }
      },
      child: CustomPaint(
        painter: ShapePainter(
            shapes: shapes, points: points, isClikedOnPen: isClickOnPen),
        size: Size.infinite,
        child: Container(),
      ),
    );
  }
}
