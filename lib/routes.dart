import 'package:apppalma/modules/Aplicaciones/aplicaciones_page.dart';
import 'package:apppalma/modules/Censo/ui/censo_page.dart';
import 'package:apppalma/modules/Cosechas/ui/cosecha_page.dart';
import 'package:apppalma/modules/Cosechas/ui/finalizar_cosecha/finalizarcosecha_page.dart';
import 'package:apppalma/modules/Cosechas/ui/registro_cosechas_diarias/registro_cosechas_page.dart';
import 'package:apppalma/modules/Enfermedad/enfermedad_page.dart';
import 'package:apppalma/modules/Fumigaciones/ui/censos_pendientes_list/censos_pendientes_page.dart';
import 'package:apppalma/modules/Home/home_screen.dart';
import 'package:apppalma/modules/Login/ui/login_page.dart';
import 'package:apppalma/modules/LoteDetail/ui/lote_page.dart';
import 'package:apppalma/modules/LotesList/presentation/lotes_page.dart';
import 'package:apppalma/modules/Palma/PalmasList/palmas_list.dart';
import 'package:apppalma/modules/Plagas/plagas/ui/plaga_page.dart';
import 'package:apppalma/modules/Plateos/ui/finalizar_plateo/finalizarplateo_page.dart';
import 'package:apppalma/modules/Plateos/ui/plateo_page.dart';
import 'package:apppalma/modules/Plateos/ui/registro_plateos_diarios/registro_plateos_diarios.dart';
import 'package:apppalma/modules/Podas/ui/poda_page.dart';
import 'package:apppalma/modules/Podas/ui/registro_podas_diarias/registro_podas_diarias.dart';
import 'package:apppalma/modules/Sync/sincronizar_page.dart';
import 'package:apppalma/modules/Viajes/ui/screens/viajes_page.dart';
import 'package:flutter/material.dart';

import '/modules/Palma/palmas_page.dart';
import 'modules/Fumigaciones/ui/fumigacion/registrar_fumigacion_page.dart';
import 'modules/Podas/ui/finalizar_plateo/finalizarpoda_page.dart';
import 'modules/Splash/splash_screen.dart';
import 'modules/Tratamientos/ui/palmas_enfermas/palmas_enfermas_page.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/auth-options':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/finca':
        return MaterialPageRoute(builder: (_) => FincaPage());
      case '/viajes':
        return MaterialPageRoute(
            builder: (_) => ViajesPage(
                  routeName: settings.name!,
                ));
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
      case '/lote/censo/enfermedad':
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
      case '/lote/cosechas/finalizarcosecha':
        return MaterialPageRoute(
          builder: (_) => FinalizarCosechaPage(routeName: settings.name!),
        );
      case '/lote/plateos':
        return MaterialPageRoute(
          builder: (_) => PlateoPage(routeName: settings.name!),
        );
      case '/lote/plateos/registroplateos':
        return MaterialPageRoute(
          builder: (_) => RegistroPlateosDiarios(routeName: settings.name!),
        );
      case '/lote/plateos/finalizarplateo':
        return MaterialPageRoute(
          builder: (_) => FinalizarPlateoPage(routeName: settings.name!),
        );
      case '/lote/podas':
        return MaterialPageRoute(
          builder: (_) => PodaPage(routeName: settings.name!),
        );
      case '/lote/podas/registropodas':
        return MaterialPageRoute(
          builder: (_) => RegistroPodasDiarias(routeName: settings.name!),
        );
      case '/lote/podas/finalizarpoda':
        return MaterialPageRoute(
          builder: (_) => FinalizarPodaPage(routeName: settings.name!),
        );
      case '/lote/censo/registrarplaga':
        return MaterialPageRoute(
          builder: (_) => PlagaPage(routeName: settings.name!),
        );
      case '/lote/aplicaciones':
        return MaterialPageRoute(
          builder: (_) => AplicacionesPage(routeName: settings.name!),
        );
      case '/lote/aplicaciones/palmasenfermas':
        return MaterialPageRoute(
          builder: (_) => PalmasEnfermasPage(routeName: settings.name!),
        );
      case '/lote/aplicaciones/censospendientes':
        return MaterialPageRoute(
          builder: (_) => CensosPendientesPage(routeName: settings.name!),
        );
      case '/lote/plagas/registrarfumigacion':
        return MaterialPageRoute(
          builder: (_) => RegistrarFumigacionPage(routeName: settings.name!),
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
