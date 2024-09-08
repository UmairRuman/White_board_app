import 'dart:math';

import 'package:flutter/material.dart';
import 'package:khurumbhi_assignment/Enum.dart';

class ShapePainter extends CustomPainter {
  final List<Shape> shapes;
  final List<List<Offset>> points;
  bool isClikedOnPen;
  ShapePainter(
      {required this.shapes,
      required this.points,
      required this.isClikedOnPen});

  @override
  void paint(Canvas canvas, Size size) {
    final paintForPenWritten = Paint()
      ..color = Colors.black
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

    final paint = Paint()
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    for (var shape in shapes) {
      paint.color = shape.color;
      switch (shape.type) {
        case ShapeType.circle:
          _drawCircle(canvas, shape, paint);
          break;
        case ShapeType.pentagon:
          _drawPentagon(canvas, shape, paint);
          break;
        case ShapeType.hexagon:
          _drawHexagon(canvas, shape, paint);
          break;
        case ShapeType.rectangle:
          _drawRectangle(canvas, shape, paint);
          break;
        case ShapeType.triangle:
          _drawTriangle(canvas, shape, paint);
          break;
      }
    }
  }

  void _drawCircle(Canvas canvas, Shape shape, Paint paint) {
    var center = shape.points.first;
    var current = shape.points.last;
    var radius = (center - current).distance;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, paint);
  }

  void _drawPentagon(Canvas canvas, Shape shape, Paint paint) {
    var path = _createPolygonPath(shape.points, 5);
    paint.style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
  }

  void _drawHexagon(Canvas canvas, Shape shape, Paint paint) {
    var path = _createPolygonPath(shape.points, 6);
    paint.style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
  }

  void _drawRectangle(Canvas canvas, Shape shape, Paint paint) {
    var topLeft = shape.points.first;
    var bottomRight = shape.points.last;
    var rect = Rect.fromPoints(topLeft, bottomRight);
    paint.style = PaintingStyle.stroke;
    canvas.drawRect(rect, paint);
  }

  void _drawTriangle(Canvas canvas, Shape shape, Paint paint) {
    var path = Path();
    var center = shape.points.first;
    var radius = (center - shape.points.last).distance;
    var angle = 2 * pi / 3;

    for (int i = 0; i < 3; i++) {
      var x = center.dx + radius * cos(i * angle - pi / 2);
      var y = center.dy + radius * sin(i * angle - pi / 2);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    paint.style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
  }

  Path _createPolygonPath(List<Offset> points, int sides) {
    var path = Path();
    var center = points.first;
    var radius = (center - points.last).distance;
    var angle = (2 * pi) / sides;

    for (int i = 0; i < sides; i++) {
      var x = center.dx + radius * cos(i * angle - pi / 2);
      var y = center.dy + radius * sin(i * angle - pi / 2);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Shape {
  final ShapeType type;
  final List<Offset> points;
  final Color color;

  Shape({required this.type, required this.points, this.color = Colors.black});
}
