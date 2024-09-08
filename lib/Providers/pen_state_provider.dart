import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khurumbhi_assignment/Notifiers/PenNotifiers/pen_animation_icon_notifier.dart';
import 'package:khurumbhi_assignment/Notifiers/PenNotifiers/pen_state_notifier.dart';

final penStateProvider =
    StateNotifierProvider<PenStateNotifier, List<List<Offset>>>((ref) {
  return PenStateNotifier();
});

final penIconProvider =
    StateNotifierProvider<PenAnimationIconNotifier, bool>((ref) {
  return PenAnimationIconNotifier();
});
