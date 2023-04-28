import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/presentation/components/main_button.dart';
import 'package:apppalma/utils/recargar_lote_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class NuevaCosechaPage extends StatefulWidget {
  final String nombrelote;
  const NuevaCosechaPage({Key? key, required this.nombrelote})
      : super(key: key);
  @override
  State<NuevaCosechaPage> createState() => _NuevaCosechaPageState();
}

class _NuevaCosechaPageState extends State<NuevaCosechaPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late DateTime fecha;

  TimeOfDay horaSalida = TimeOfDay.now();
  @override
  void initState() {
    fecha = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, horaSalida.hour, horaSalida.minute);
    super.initState();
  }

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;

    // return buildNuevaCosechaForm();
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          GestureDetector(
            onTap: () => _submit(),
            child: Column(
              children: const [
                CircularBorder(
                  width: 6,
                  size: 55,
                  color: Colors.blue,
                  icon: Icon(Icons.add, color: Colors.blue),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Comenzar nueva cosecha",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget botonNuevaCosecha() {
    return MainButton(
        text: 'Comenzar cosecha',
        press: () {
          _submit();
        });
  }

  void _submit() {
    BlocProvider.of<CosechaCubit>(context)
        .comenzarNuevaCosecha(widget.nombrelote, fecha);
    //Recargar lista de lotes
    recargarLote(context);
  }
}

class CircularBorder extends StatelessWidget {
  final Color color;
  final double size;
  final double width;
  final Widget icon;

  const CircularBorder(
      {Key? key,
      this.color = Colors.blue,
      this.size = 70,
      this.width = 10.0,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          icon,
          CustomPaint(
            size: Size(size, size),
            foregroundPainter:
                MyPainterHere(completeColor: color, width: width),
          ),
        ],
      ),
    );
  }
}

class MyPainterHere extends CustomPainter {
  Color lineColor = Colors.transparent;
  Color completeColor;
  double width;
  MyPainterHere({required this.completeColor, required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    var percent = (size.width * 0.001) / 2;

    double arcAngle = 2 * pi * percent;

    for (var i = 0; i < 8; i++) {
      var init = (-pi / 2) * (i / 2);

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), init,
          arcAngle, false, complete);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
