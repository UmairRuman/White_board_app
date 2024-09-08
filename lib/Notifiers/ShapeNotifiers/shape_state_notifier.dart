import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Enum.dart';
import 'package:khurumbhi_assignment/Widgets/Painterwidgets/ShapePainterWidget/ShapeWidgets/circleShape.dart';

class ShapeStateNotifier extends StateNotifier<List<Shape>> {
  ShapeStateNotifier() : super([]);
  ShapeType currentShapeType = ShapeType.circle;
  Color currentColor = Colors.black;

  void setShapeType(ShapeType shapeType) {
    currentShapeType = shapeType;
  }

  void setShapeColor(Color color) {
    currentColor = color;
  }

  void onPanStart(DragStartDetails details, BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var newPoint = [renderBox.globalToLocal(details.globalPosition)];
    state = [
      ...state,
      Shape(type: currentShapeType, points: newPoint, color: currentColor)
    ];
  }

  void onPanUpdate(DragUpdateDetails details, BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final updatedPoint = renderBox.globalToLocal(details.globalPosition);
    final updatedShapes = List<Shape>.from(state);
    updatedShapes.last.points.add(updatedPoint);
    state = updatedShapes;
  }

  void onUndoClick() {
    state.removeLast();
  }
}
