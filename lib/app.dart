import 'package:apppalma/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:apppalma/presentation/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/presentation/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/presentation/modules/Erradicaciones/cubit/erradicacion_cubit.dart';
import 'package:apppalma/presentation/modules/Fertilizaciones/cubit/fertilizaciones_cubit.dart';
import 'package:apppalma/presentation/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/presentation/modules/Login/cubit/authentication_cubit.dart';
import 'package:apppalma/presentation/modules/Login/ui/cubit/login_cubit.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/presentation/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/presentation/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/presentation/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/presentation/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/presentation/modules/Pluviometro/cubit/pluviometro_cubit.dart';
import 'package:apppalma/presentation/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/presentation/modules/Productos_Agroquimicos/cubit/agroquimicos_cubit.dart';
import 'package:apppalma/presentation/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:apppalma/presentation/modules/Viajes/ui/peso_extractora/cubit/peso_extractora_cubit.dart';
import 'package:apppalma/presentation/modules/Viajes/ui/primera_pagina/cubit/viajes_pendientes_cubit.dart';
import 'package:apppalma/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/modules/Sync/cubit/bajar_info_cubit.dart';
import 'presentation/modules/Viajes/cubit/viaje_cubit.dart';
import 'globals.dart';

class AppPalma extends StatelessWidget {
  const AppPalma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initResponsable();
    // final authenticationRepository = AuthenticationRepository();
    // final userRepository = UserRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<BajarInfoCubit>(create: (context) => BajarInfoCubit()),
        BlocProvider<AuthenticationCubit>(
            create: (context) => AuthenticationCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<PluviometroCubit>(create: (context) => PluviometroCubit()),
        BlocProvider<LoteslistCubit>(create: (context) => LoteslistCubit()),
        BlocProvider<LoteDetailCubit>(create: (context) => LoteDetailCubit()),
        BlocProvider<CensosCubit>(create: (context) => CensosCubit()),
        BlocProvider<PalmaCubit>(create: (context) => PalmaCubit()),
        BlocProvider<EnfermedadCubit>(create: (context) => EnfermedadCubit()),
        // BlocProvider<ErradicacionCubit>(
        //     create: (context) => ErradicacionCubit()),
        BlocProvider<AgroquimicosCubit>(
            create: (context) => AgroquimicosCubit()),
        BlocProvider<PlagasCubit>(create: (context) => PlagasCubit()),
        BlocProvider<CosechaCubit>(create: (context) => CosechaCubit()),
        BlocProvider<PlateosCubit>(create: (context) => PlateosCubit()),
        BlocProvider<FumigacionCubit>(create: (context) => FumigacionCubit()),
        BlocProvider<PodasCubit>(create: (context) => PodasCubit()),
        BlocProvider<TratamientoCubit>(create: (context) => TratamientoCubit()),
        BlocProvider<ErradicacionCubit>(
            create: (context) => ErradicacionCubit()),
        BlocProvider<FertilizacionCubit>(
            create: (context) => FertilizacionCubit()),
        BlocProvider<ViajeCubit>(create: (context) => ViajeCubit()),
        BlocProvider<ViajesPendientesCubit>(
            create: (context) => ViajesPendientesCubit()),
        BlocProvider<PesoExtractoraCubit>(
            create: (context) => PesoExtractoraCubit()),
        BlocProvider<SyncToServerCubit>(
            create: (context) => SyncToServerCubit()),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          title: 'Smart Spotter',
          theme: ThemeData(
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
          supportedLocales: const [Locale('en')],
          onGenerateRoute: Routes.generateRoutes,
        ),
      ),
    );
  }
}
