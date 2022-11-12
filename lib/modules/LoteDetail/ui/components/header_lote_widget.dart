import 'package:apppalma/constants.dart';
import 'package:apppalma/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/lote_detail_cubit.dart';

class HeaderLote extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String routeName;
  const HeaderLote({Key? key, required this.height, required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.screenHeight;
    final paddingTop = SizeConfig.paddingTop;
    return BlocBuilder<LoteDetailCubit, LoteDetailState>(
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: CustomPaint(
                painter: _HeaderWavePainter(this.height),
              ),
            ),
            Positioned(
              top: paddingTop + 15,
              right: 0.0,
              left: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor, shape: BoxShape.circle),
                    child: IconButton(
                        splashColor: kPrimaryColor,
                        splashRadius: 10,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        )),
                  ),
                  textHeader(state),
                  Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor, shape: BoxShape.circle),
                    child: IconButton(
                        splashColor: kPrimaryColor,
                        splashRadius: 10,
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: kPrimaryColor,
                        )),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget textHeader(LoteDetailState state) {
    final height = SizeConfig.screenHeight;
    if (state is LoteChoosed) {
      return Text(
        state.lote.lote.nombreLote,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      );
    } else {
      return const Text('');
    }
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _HeaderWavePainter extends CustomPainter {
  final double height;

  _HeaderWavePainter(this.height);

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    //Propiedades
    lapiz.color = kPrimaryColor;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 25.0;

    final path = Path();

    //Dibujar con el lapiz y el path
    path.lineTo(0, height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
    //     size.width * 0.5, size.height * 0.25);

    // path.quadraticBezierTo(
    //     size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);

    // path.lineTo(size.width, size.height * 0.25);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
