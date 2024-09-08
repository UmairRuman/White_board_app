import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Notifiers/ArrowNotifiers/arrow_animation_state_notifier.dart';
import 'package:khurumbhi_assignment/Notifiers/ColorNotifiers/color_state_notifier.dart';
import 'package:khurumbhi_assignment/Notifiers/ShapeNotifiers/shape_animation_state_notifier.dart';
import 'package:khurumbhi_assignment/Notifiers/StrokeNotifiers/stroke_animation_state_notifier.dart';

final shapeAnimationProvider =
    StateNotifierProvider<ShapeAnimationStateNotifier, bool>((ref) {
  return ShapeAnimationStateNotifier();
});

final colorsAnimationProvider =
    StateNotifierProvider<ColorStateNotifier, bool>((ref) {
  return ColorStateNotifier();
});

final strokeAnimationProvider =
    StateNotifierProvider<StrokeStateNotifier, bool>((ref) {
  return StrokeStateNotifier();
});

final arrowAnimationProvider =
    StateNotifierProvider<ArrowAnimationStateNotifier, bool>((ref) {
  return ArrowAnimationStateNotifier();
});
