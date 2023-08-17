import 'package:apppalma/presentation/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../size_config.dart';
import '../../../../components/widgets/header_gradient.dart';
import '../../../Censo/cubit/censos_cubit.dart';
import '../../../LoteDetail/cubit/lote_detail_cubit.dart';
import '../fumigacion/registrar_fumigacion_page.dart';
import 'censos_plaga_list.dart';
import 'dart:math' as math;

class CensosPendientesPage extends StatefulWidget {
  final String routeName;

  const CensosPendientesPage({Key? key, required this.routeName})
      : super(key: key);

  @override
  State<CensosPendientesPage> createState() => _CensosPendientesPageState();
}

class _CensosPendientesPageState extends State<CensosPendientesPage> {
  late String nombreLote;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
    }
    BlocProvider.of<FumigacionCubit>(context).clear();
    BlocProvider.of<CensosCubit>(context).obtenerCensosPendientes(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CensosCubit, CensosState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 125 + SizeConfig.paddingTop,
                maxHeight: 125 + SizeConfig.paddingTop,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: HeaderGradient(
                    title: "Lista de censos",
                    ruta: widget.routeName,
                  ),
                ),
              ),
            ),
            if (state.censos != null && state.censo == null)
              CensosPlagaList(censosPendientes: state.censos!),
            if (state.censo != null && state.censo != null)
              const RegistrarFumigacionPage(),
            if (state.censos == null && state.censo == null)
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, childCount: 1)),
          ],
        );
      },
    ));
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
