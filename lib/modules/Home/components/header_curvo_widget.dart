import 'package:flutter/material.dart';

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage(
      //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN4HJhnJo07reTM0Lta1HoTollHloqsqRUVw&usqp=CAU'),
      //   ),
      // ),
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    //Propiedades
    lapiz.color = const Color(0xFF2D6A4F);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 25.0;

    final path = Path();

    //Dibujar con el lapiz y el path
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.85,
        size.width * 0.5, size.height * 0.65);

    // path.quadraticBezierTo(
    //     size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // path.lineTo(size.width, size.height * 0.25);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
