import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/modules/Plateos/ui/nuevo_plateo/nuevoplateo_view.dart';
import 'package:apppalma/modules/Plateos/ui/plateo_activo/plateoactivo_page.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PlateoPage extends StatefulWidget {
  final String routeName;

  const PlateoPage({Key? key, required this.routeName}) : super(key: key);
  @override
  _PlateoPageState createState() => _PlateoPageState();
}

class _PlateoPageState extends State<PlateoPage> {
  Plateo? plateo;
  late String nombreLote;
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  late double separacion;

  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.nombreLote;
    }
    BlocProvider.of<PlateosCubit>(context).obtenerPlateoActivo(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;
    separacion = height * 0.025; //150,

    return Scaffold(
      body: Column(
        children: [
          HeaderApp(
            ruta: widget.routeName,
          ),
          crearContenido(),
        ],
      ),
    );
  }

  Widget crearContenido() {
    return SingleChildScrollView(
      child: BlocConsumer<PlateosCubit, PlateosStateLoaded>(
          listener: (context, state) {
        setState(() {
          if (state is PlateosStateLoaded) {
            plateo = state.plateo;
            setState(() {});
          }
        });
      }, builder: (context, state) {
        if (state.isLoaded) {
          plateo = state.plateo;
          return plateo != null
              ? PlateoActivoVista(plateo: plateo!)
              : NuevoPlateoView(nombrelote: nombreLote);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  //
}

//   Widget _buildNuevoPlateo() {
//   return GestureDetector(
//     child: Container(
//       height: altoCard,
//       decoration: BoxDecoration(
//           color: Colors.blue[50],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Center(
//           child: Text('Presione para comenzar un nuevo plateo ', style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center ,)
//         ) ,
//       ),
//       onTap: (){
//         setState(() {
//           _podaactiva = true;
//         });
//       },
//     );
//   }

//   Widget _buildPlateo() {
//     return Container(
//       margin: EdgeInsets.all(margin),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey[400],
//               blurRadius: 5,
//               offset: Offset(0, 2))
//         ]),
//       child:Column(
//         children : <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.blue[200],
//             ),
//             width: anchoCard,
//             padding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
//             child: Expanded(
//               child:Text('Detalles de plateo', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(25),
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                      Container(
//                       child: Expanded(
//                         child:Text('Fecha de inicio : ', style: TextStyle(color: Colors.black, fontSize: 18),),
//                       ),
//                     ),
//                     Container(
//                       child: Expanded(
//                         child:Text('$fechainicio', style: TextStyle(color: Colors.grey, fontSize: 18), textAlign: TextAlign.center,),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: altoCard*0.05),
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       child: Expanded(
//                         child:Text('Plateos registrados : ', style: TextStyle(color: Colors.black, fontSize: 18),),
//                       ),
//                     ),
//                     Container(
//                       child: Expanded(
//                         child:Text('$podasregistradas', style: TextStyle(color: Colors.grey, fontSize: 18), textAlign: TextAlign.center,),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       child: Expanded(
//                         child:Text('Palmas plateadas : ', style: TextStyle(color: Colors.black, fontSize: 18),),
//                       ),
//                     ),
//                     Container(
//                       child: Expanded(
//                         child:Text('$palmasplateadas', style: TextStyle(color: Colors.grey, fontSize: 18), textAlign: TextAlign.center,),
//                       ),
//                     ),
//                   ],
//                 ),

//               ],
//             ),
//           ),
//         ]
//       )
//     );
//   }

//   Widget _buildFinalizarPlateo( BuildContext context ) {
//     return Container(
//       margin: EdgeInsets.all(30),
//       height: altoCard*0.3,
//       width: anchoCard*0.8,
//       child:  RaisedButton(
//         child: Text('Finalizar plateo', style: TextStyle(fontSize:20),),
//         color: Colors.red[100],
//         shape: StadiumBorder(),
//         onPressed: () {
//          _confimarcionAlerta( context );
//         }
//       )
//     );
//   }

//    void _confimarcionAlerta( BuildContext context ) {
//      showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder:( context ) {
//         return AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Text('¿Realmente desea finalizar la cosecha?'),
//             ],
//           ),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('Cancelar'),
//               onPressed: (){ },
//             ),
//             FlatButton(
//               child: Text('Ok'),
//               onPressed: (){
//                 setState(() {
//                   // _pendientedecarga = true;
//                 });
//                 Navigator.of(context).pop();
//               },
//             )
//           ]
//         );
//        }
//      );
//    }
// }
