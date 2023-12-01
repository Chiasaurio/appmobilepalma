import 'package:apppalma/presentation/modules/Censo_Productivo/page.dart';
import 'package:apppalma/presentation/modules/Censo_Productivo/ui/agregar_censo_productivo_page.dart';
import 'package:flutter/material.dart';

import 'SyncToServer/ui/sincronizar_a_servidor_page.dart';
import 'presentation/modules/Aplicaciones/ui/aplicaciones_page.dart';
import 'presentation/modules/Censo/ui/censo_page.dart';
import 'presentation/modules/Cosechas/ui/cosecha_page.dart';
import 'presentation/modules/Cosechas/ui/registro_cosechas_diarias/registro_cosechas_page.dart';
import 'presentation/modules/Enfermedad/enfermedad_page.dart';
import 'presentation/modules/Fertilizaciones/ui/fertilizacion_page.dart';
import 'presentation/modules/Fumigaciones/ui/censos_pendientes_list/censos_pendientes_page.dart';
import 'presentation/modules/Home/home_screen.dart';
import 'presentation/modules/Login/ui/login_page.dart';
import 'presentation/modules/LotesList/presentation/lotes_page.dart';
import 'presentation/modules/Plagas/plagas/ui/plaga_page.dart';
import 'presentation/modules/Plateos/ui/plateo_page.dart';
import 'presentation/modules/Plateos/ui/registro_plateos_diarios/registro_plateos_diarios.dart';
import 'presentation/modules/Pluviometro/pluviometro_page.dart';
import 'presentation/modules/Podas/ui/poda_page.dart';
import 'presentation/modules/Podas/ui/registro_podas_diarias/registro_podas_diarias.dart';
import 'presentation/modules/Sync/sincronizar_page.dart';
import 'presentation/modules/Fertilizaciones/ui/registro_fertilizaciones_diarias/registro_fertilizaciones_diarias.dart';
import 'presentation/modules/Palma/ui/palmas_page.dart';
import 'presentation/modules/Fumigaciones/ui/fumigacion/registrar_fumigacion_page.dart';
import 'presentation/modules/Splash/splash_screen.dart';
import 'presentation/modules/Tratamientos/ui/palmas_enfermas/palmas_enfermas_page.dart';
import 'presentation/modules/Viajes/ui/segunda_pagina/screens/viajes_page.dart';
import 'presentation/modules/Viajes/ui/tercera_pagina/screens/datos_viaje_page.dart';
import 'presentation/modules/Viajes/ui/primera_pagina/screens/viajes_pendientes_page.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/auth-options':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/finca':
        return MaterialPageRoute(builder: (_) => const FincaPage());
      case '/pluviometro':
        return MaterialPageRoute(
            builder: (_) => PluviometroPage(
                routeName: settings.name!,
                disableBack: settings.arguments != null
                    ? settings.arguments as bool
                    : null));
      case '/viajes':
        return MaterialPageRoute(
            builder: (_) => ViajesPendientesPage(
                routeName: settings.name!,
                disableBack: settings.arguments != null
                    ? settings.arguments as bool
                    : null));
      case '/viajes/nuevoviaje':
        return MaterialPageRoute(
            builder: (_) => NuevoViajePage(
                  routeName: settings.name!,
                ));
      case '/viajes/datosviaje':
        return MaterialPageRoute(
            builder: (_) => DatosViajesPage(
                  routeName: settings.name!,
                ));
      case '/lotes':
        return MaterialPageRoute(
            builder: (_) => EscogerLotePage(
                disableBack: settings.arguments != null
                    ? settings.arguments as bool
                    : null));
      case '/sincronizar':
        return MaterialPageRoute(
            builder: (_) => SincronizacionPage(
                routeName: settings.name!,
                disableBack: settings.arguments != null
                    ? settings.arguments as bool
                    : null));
      case '/sinctoserver':
        return MaterialPageRoute(
            builder: (_) => SyncToServerPage(
                routeName: settings.name!,
                disableBack: settings.arguments != null
                    ? settings.arguments as bool
                    : null));
      case '/lote/censo/enfermedades':
        return MaterialPageRoute(
            builder: (_) => CensoPage(routeName: settings.name!));
      case '/lote/censo/enfermedad':
        return MaterialPageRoute(
            builder: (_) => EnfermedadPage(routeName: settings.name!));
      case '/lote/palmas':
        return MaterialPageRoute(builder: (_) => const PalmasPage());
      // case '/lote/palmas/estadopalmas':
      //   return MaterialPageRoute(
      //       builder: (_) => PalmasList(routeName: settings.name!));
      case '/lote/cosechas':
        return MaterialPageRoute(
          builder: (_) => CosechaPage(routeName: settings.name!),
        );
      case '/lote/cosechas/registrocosechas':
        return MaterialPageRoute(
          builder: (_) => RegistroCosechasDiarias(routeName: settings.name!),
        );
      case '/lote/plateos':
        return MaterialPageRoute(
          builder: (_) => PlateoPage(routeName: settings.name!),
        );
      case '/lote/plateos/registroplateos':
        return MaterialPageRoute(
          builder: (_) => RegistroPlateosDiarios(routeName: settings.name!),
        );
      case '/lote/podas':
        return MaterialPageRoute(
          builder: (_) => PodaPage(routeName: settings.name!),
        );
      case '/lote/podas/registropodas':
        return MaterialPageRoute(
          builder: (_) => RegistroPodasDiarias(routeName: settings.name!),
        );
      case '/lote/censo/registrarplaga':
        return MaterialPageRoute(
          builder: (_) => PlagaPage(routeName: settings.name!),
        );
      case '/lote/censo/plagas':
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
      case '/lote/fertilizaciones':
        return MaterialPageRoute(
          builder: (_) => FertilizacionPage(routeName: settings.name!),
        );
      case '/lote/fertilizaciones/registrofertilizaciones':
        return MaterialPageRoute(
          builder: (_) =>
              RegistroFertilizacionesDiarias(routeName: settings.name!),
        );
      case '/lote/censoproductivo':
        return MaterialPageRoute(
          builder: (_) => CensoProductivoPage(routeName: settings.name!),
        );
      case '/lote/censoproductivo/nuevo':
        return MaterialPageRoute(
          builder: (_) => AgregarCensoProductivoPage(routeName: settings.name!),
        );
      // case '/lote/palmas/erradicar':
      //   return MaterialPageRoute(
      //       builder: (_) => ErradicacionPage(routeName: settings.name!));
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
