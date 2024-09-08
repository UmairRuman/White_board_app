import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArrowAnimationStateNotifier extends StateNotifier<bool> {
  ArrowAnimationStateNotifier() : super(false);

  void onArrowIconClick() {
    log(state.toString());
    state = !state;
    log(state.toString());
  }
}
