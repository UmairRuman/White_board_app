import 'package:flutter_riverpod/flutter_riverpod.dart';

class PenAnimationIconNotifier extends StateNotifier<bool> {
  PenAnimationIconNotifier() : super(false);
  void onPenClick() {
    state = !state;
  }
}
