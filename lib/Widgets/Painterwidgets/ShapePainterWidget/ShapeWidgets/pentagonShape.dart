import 'package:flutter/material.dart';

class PentagonShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    var paintForPentagon = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(width * 0.5, 0);
    path.lineTo(width, height * 0.4);
    path.lineTo(width * 0.8, height);
    path.lineTo(width * 0.2, height);
    path.lineTo(0, height * 0.4);
    path.close();
    canvas.drawPath(path, paintForPentagon);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
