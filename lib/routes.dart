import 'package:apppalma/Censo/ui/censo_page.dart';
import 'package:apppalma/Enfermedad/enfermedad_form.dart';
import 'package:apppalma/Enfermedad/enfermedad_page.dart';
import 'package:apppalma/Home/home_screen.dart';
import 'package:apppalma/LoteDetail/ui/lote_page.dart';
import 'package:apppalma/LotesList/presentation/lotes_page.dart';
import 'package:apppalma/Sync/sincronizar_page.dart';
import 'package:flutter/material.dart';

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
      case 'lote/censo/enfermedad':
        return MaterialPageRoute(
            builder: (_) => EnfermedadPage(routeName: settings.name!));

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
