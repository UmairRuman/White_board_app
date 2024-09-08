import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Notifiers/ColorNotifiers/color_change_state_notifier.dart';

final colorStateProvider =
    StateNotifierProvider<ColorChangeStateNotifier, Color>((ref) {
  return ColorChangeStateNotifier();
});
