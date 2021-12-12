import 'package:apppalma/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/components/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../size_config.dart';

class HeaderApp extends StatefulWidget {
  final int? selectedIndex;
  final double height;
  final String? ruta;
  final bool goBackEnabled;
  final Widget? action;
  const HeaderApp({
    Key? key,
    this.height = 80,
    this.ruta,
    this.selectedIndex,
    this.goBackEnabled = true,
    this.action,
  }) : super(key: key);

  @override
  State<HeaderApp> createState() => _HeaderAppState();
}

class _HeaderAppState extends State<HeaderApp> {
  late double paddingtop;

  late String nombreLote;

  @override
  Widget build(BuildContext context) {
    paddingtop = SizeConfig.paddingTop;
    return BlocBuilder<LoteDetailCubit, LoteDetailState>(
        builder: (context, state) {
      if (state is LoteChoosed) {
        nombreLote = state.lote.nombreLote;
      } else {
        nombreLote = 'Finca CampoAlegre';
      }
      return buildBody(context);
    });
  }

  Widget buildBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: paddingtop,
        ),
        height: widget.height,
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius. vertical(bottom: Radius.circular(20)),
            color: AppPalmaColors.blue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.goBackEnabled
                      ? InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.ruta ?? 'ruta',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        nombreLote,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  //icon for align
                  widget.action != null
                      ? widget.action!
                      : const Icon(Icons.wb_sunny, color: Colors.transparent),
                ],
              ),
            ),
          ],
        ));
  }
}
