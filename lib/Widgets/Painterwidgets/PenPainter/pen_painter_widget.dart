import 'package:flutter/material.dart';

class PenPainterWidget extends CustomPainter {
  final List<List<Offset>> points;
  bool isClikedOnPen;
  Color paintColor;
  PenPainterWidget(
      {required this.points,
      required this.isClikedOnPen,
      required this.paintColor});
  @override
  void paint(Canvas canvas, Size size) {
    final paintForPenWritten = Paint()
      ..color = paintColor
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    if (isClikedOnPen) {
      for (List<Offset> stroke in points) {
        for (int i = 0; i < stroke.length - 1; i++) {
          if (stroke[i] != null && stroke[i + 1] != null) {
            canvas.drawLine(stroke[i], stroke[i + 1], paintForPenWritten);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
