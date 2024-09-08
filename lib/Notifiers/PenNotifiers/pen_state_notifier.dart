import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PenStateNotifier extends StateNotifier<List<List<Offset>>> {
  bool isClickedOnPen = false;
  List<List<Offset>>? temporaryList;
  PenStateNotifier() : super([]);

  void onPanStart(DragStartDetails details, BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final newPoint = [renderBox.globalToLocal(details.globalPosition)];
    state = [...state, newPoint];
  }

  void onPanUpdate(DragUpdateDetails details, BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final updatedPoint = renderBox.globalToLocal(details.globalPosition);
    final updatedState = List<List<Offset>>.from(state);
    updatedState.last.add(updatedPoint);
    state = updatedState;
    temporaryList = state;
  }

  void onUndo() {
    temporaryList = List<List<Offset>>.from(state);
    state.removeLast();
  }

  void onRedo() {
    state = temporaryList!;
  }
}
