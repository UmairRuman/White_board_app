import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Notifiers/ShapeNotifiers/circle_click_notifier.dart';
import 'package:khurumbhi_assignment/Notifiers/ShapeNotifiers/shape_state_notifier.dart';
import 'package:khurumbhi_assignment/Widgets/Painterwidgets/ShapePainterWidget/ShapeWidgets/circleShape.dart';

final shapeStateProvider =
    StateNotifierProvider<ShapeStateNotifier, List<Shape>>((ref) {
  return ShapeStateNotifier();
});

final circleClickProvider = StateNotifierProvider<CircleClickNotifier, bool>(
    (ref) => CircleClickNotifier());
