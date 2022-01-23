import 'package:apppalma/Censo/ui/censo_page.dart';
import 'package:apppalma/Cosechas/ui/cosecha_page.dart';
import 'package:apppalma/Cosechas/ui/finalizar_cosecha/finalizarcosecha_page.dart';
import 'package:apppalma/Cosechas/ui/registro_cosechas_diarias/registro_cosechas_page.dart';
import 'package:apppalma/Enfermedad/enfermedad_page.dart';
import 'package:apppalma/Home/home_screen.dart';
import 'package:apppalma/LoteDetail/ui/lote_page.dart';
import 'package:apppalma/LotesList/presentation/lotes_page.dart';
import 'package:apppalma/Palma/PalmasList/palmas_list.dart';
import 'package:apppalma/Sync/sincronizar_page.dart';
import 'package:flutter/material.dart';

import 'Palma/palmas_page.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // case '/splash':
      //   return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/finca':
        return MaterialPageRoute(builder: (_) => FincaPage());
      case '/lotes':
        return MaterialPageRoute(builder: (_) => EscogerLotePage());
      case '/sincronizar':
        return MaterialPageRoute(builder: (_) => SincronizacionPage());
      case '/lote':
        return MaterialPageRoute(
            builder: (_) => LotePage(routeName: settings.name!));
      case '/lote/censo':
        return MaterialPageRoute(
            builder: (_) => CensoPage(routeName: settings.name!));
      case 'lote/censo/enfermedad':
        return MaterialPageRoute(
            builder: (_) => EnfermedadPage(routeName: settings.name!));
      case '/lote/palmas':
        return MaterialPageRoute(builder: (_) => PalmaPage());
      case '/lote/palmas/estadopalmas':
        return MaterialPageRoute(
            builder: (_) => PalmasList(routeName: settings.name!));
      case '/lote/cosechas':
        return MaterialPageRoute(
          builder: (_) => CosechaPage(routeName: settings.name!),
        );
      case '/lote/cosechas/registrocosechas':
        return MaterialPageRoute(
          builder: (_) => RegistroCosechasDiarias(routeName: settings.name!),
        );
      case '/lote/cosechas/registrardiarias':
        return MaterialPageRoute(
          builder: (_) => RegistroCosechasDiarias(routeName: settings.name!),
        );
      case '/lote/cosechas/finalizarcosecha':
        return MaterialPageRoute(
          builder: (_) => FinalizarCosechaPage(routeName: settings.name!),
        );
      // case 'lote/censo/plaga':
      //   return MaterialPageRoute(
      //       builder: (_) => CensoPage(routeName: settings.name!));
      default:
        return _errorScreen();
    }
  }

  static Route<dynamic> _errorScreen() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Error 404"),
          ),
          body: const Center(
            child: Text('Error'),
          ));
    });
  }
}
