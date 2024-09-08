import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShapeAnimationStateNotifier extends StateNotifier<bool> {
  ShapeAnimationStateNotifier() : super(false);

  void onShapeIconClick() {
    log(state.toString());
    state = !state;
    log(state.toString());
  }
}
