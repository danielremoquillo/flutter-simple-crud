import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key, required this.length});
  final double length;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RoundedLinePainter(),
      size: Size(length, 1.0),
    );
  }
}

class RoundedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width - 10, size.height / 2);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
