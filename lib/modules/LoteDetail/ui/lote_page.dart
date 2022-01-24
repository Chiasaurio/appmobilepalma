import 'package:apppalma/modules/LoteDetail/ui/body.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LotePage extends StatefulWidget {
  final String routeName;

  const LotePage({Key? key, required this.routeName}) : super(key: key);
  @override
  _LotePageState createState() => _LotePageState();
}

class _LotePageState extends State<LotePage> {
  String ruta = '/lote';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoteDetailCubit, LoteDetailState>(
      builder: (context, state) {
        return Scaffold(
            appBar: HeaderApp(
              ruta: ruta,
            ),
            body: state is LoteChoosed
                ? const Body()
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}
