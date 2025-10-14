import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;

  DashedLinePainter({this.color = Colors.black, this.dashWidth = 5, this.dashSpace = 3, this.strokeWidth = 1});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    double startX = 35;
    final y = size.height / 2;

    while (startX < size.width - 35) {
      final endX = startX + dashWidth;
      canvas.drawLine(Offset(startX, y), Offset(endX < size.width ? endX : size.width, y), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
