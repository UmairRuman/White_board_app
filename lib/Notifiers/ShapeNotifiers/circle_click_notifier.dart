import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CircleClickNotifier extends StateNotifier<bool> {
  CircleClickNotifier() : super(false);

  void onCircleClick() {
    log("In Circle : ${state.toString()}");
    state = !state;
    log("In Circle : ${state.toString()}");
  }
}
