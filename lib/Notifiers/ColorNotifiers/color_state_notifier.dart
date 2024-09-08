import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorStateNotifier extends StateNotifier<bool> {
  ColorStateNotifier() : super(false);

  void onColorIconClick() {
    log(state.toString());
    state = !state;
    log(state.toString());
  }
}
