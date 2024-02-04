import 'package:flutter/material.dart';

class DiagonalBackgroundPainter extends CustomPainter {
  DiagonalBackgroundPainter({required this.paintColor});

  Color paintColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paintBlue = Paint()..color = paintColor;

    // Blue path
    final pathBlue = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.5)
      ..close();
    canvas.drawPath(pathBlue, paintBlue);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
