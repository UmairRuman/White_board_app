import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class StrokeStateNotifier extends StateNotifier<bool> {
  StrokeStateNotifier() : super(false);

  void onStrokeIconClick() {
    log(state.toString());
    state = !state;
    log(state.toString());
  }
}
