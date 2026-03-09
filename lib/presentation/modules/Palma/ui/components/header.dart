import 'package:apppalma/presentation/constants.dart';
import 'package:flutter/material.dart';

class HeaderWave extends StatelessWidget {
  final bool leftTab;

  const HeaderWave({super.key, required this.leftTab});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(leftTab),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  final bool leftTab;

  _HeaderWavePainter(this.leftTab);

  @override
  void paint(Canvas canvas, Size size) {
    double startHeight = 150;
    double topHeight = 125;
    double bottomHeight = 175;

    double halfWidth = size.width * 0.5;
    double lessHalfWidth = halfWidth - 30;
    double moreHalfWidth = halfWidth + 30;

    final Rect rect =
        Rect.fromCircle(center: const Offset(0.0, 55.0), radius: 180);
    const Gradient gradiente = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          kpurpleColor,
          kblueColor,
        ],
        stops: [
          0.55,
          0.85
        ]);

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = Path();
    if (leftTab) {
      // Dibujar con el path y el lapiz
      path.lineTo(0, startHeight);
      path.quadraticBezierTo(0, bottomHeight, 30, bottomHeight);

      path.lineTo(lessHalfWidth, bottomHeight);
      path.quadraticBezierTo(halfWidth, bottomHeight, halfWidth, startHeight);

      path.quadraticBezierTo(halfWidth, topHeight, moreHalfWidth, topHeight);
      path.lineTo(size.width - 30, topHeight);

      path.quadraticBezierTo(size.width, topHeight, size.width, startHeight);

      path.lineTo(size.width, 0);
      canvas.drawPath(path, lapiz);
    } else {
      // // Dibujar con el path y el lapiz
      path.lineTo(0, startHeight);
      path.quadraticBezierTo(0, topHeight, 30, topHeight);

      path.lineTo(lessHalfWidth, topHeight);
      path.quadraticBezierTo(halfWidth, topHeight, halfWidth, startHeight);

      path.quadraticBezierTo(
          halfWidth, bottomHeight, moreHalfWidth, bottomHeight);
      path.lineTo(size.width - 30, bottomHeight);

      path.quadraticBezierTo(size.width, bottomHeight, size.width, startHeight);

      path.lineTo(size.width, 0);

      canvas.drawPath(path, lapiz);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
