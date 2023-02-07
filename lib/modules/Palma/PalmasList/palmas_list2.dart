// import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
// import 'package:apppalma/modules/Palma/PalmasList/palmas_lote_list.dart';
// import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
// import 'package:apppalma/components/custom_appbar.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// class PalmasList extends StatefulWidget {
//   final String routeName;

//   const PalmasList({Key? key, required this.routeName}) : super(key: key);
//   @override
//   State<PalmasList> createState() => _PalmasListState();
// }

// class _PalmasListState extends State<PalmasList> {
//   // final podaBloc = new PodasBloc();
//   // final plateoBloc = new PlateosBloc();
//   // final cosechaBloc = new CosechasBloc();
//   late String nombreLote;
//   @override
//   void initState() {
//     final state = BlocProvider.of<LoteDetailCubit>(context).state;
//     if (state is LoteChoosed) {
//       nombreLote = state.lote.lote.nombreLote;
//     }
//     BlocProvider.of<PalmaCubit>(context).obtenerPalmasLote(nombreLote);
//     super.initState();
//   }

//   String nombrelote = '';
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PalmaCubit, PalmaState>(
//       builder: (context, state) {
//         return Scaffold(
//             body: SingleChildScrollView(
//           physics: const NeverScrollableScrollPhysics(),
//           child: Column(
//             children: [
//               HeaderApp(
//                 ruta: widget.routeName,
//               ),
//               state.palmas != null
//                   ? Body(palmas: state.palmas!)
//                   : const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//             ],
//           ),
//         ));
//       },
//     );
//   }
// }
