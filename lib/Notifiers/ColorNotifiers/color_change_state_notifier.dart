import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorChangeStateNotifier extends StateNotifier<Color> {
  ColorChangeStateNotifier() : super(Colors.black);

  void onClickChangeColor(Color color) {
    state = color;
    log("$state Chosed");
  }
}
