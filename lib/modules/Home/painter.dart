import 'package:flutter/material.dart';
import 'dart:math';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final radius = min(size.height, size.width) / 2;
    // final paint = Paint()..color = Colors.yellow;
    // canvas.drawLine(Offset.zero, const Offset(20, 20), Paint());
    // canvas.drawCircle(const Offset(20, 100), radius, paint);
    var paint = Paint()
      ..color = Color(0xFF2D6A4F)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(0, size.height, size.width * 0.5, size.height * 0.8);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
    //     size.width * 1.0, size.height * 0.8);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
