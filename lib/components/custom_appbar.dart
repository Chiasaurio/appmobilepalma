import 'package:apppalma/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/components/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../size_config.dart';

class HeaderApp extends StatefulWidget implements PreferredSizeWidget {
  final int? selectedIndex;
  final double height;
  final String ruta;
  final bool goBackEnabled;
  final Widget? action;
  const HeaderApp({
    Key? key,
    this.height = 60,
    required this.ruta,
    this.selectedIndex,
    this.goBackEnabled = true,
    this.action,
  }) : super(key: key);

  @override
  State<HeaderApp> createState() => _HeaderAppState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _HeaderAppState extends State<HeaderApp> {
  late double paddingtop;

  String nombreLote = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoteDetailCubit, LoteDetailState>(
      builder: (context, state) {
        if (state is LoteChoosed) {
          nombreLote = state.lote.nombreLote;
        }
        return AppBar(
          backgroundColor: AppPalmaColors.blue,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.ruta,
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                nombreLote,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}
