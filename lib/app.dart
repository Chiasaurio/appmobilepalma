import 'package:apppalma/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/modules/Login/bloc/authentication_bloc.dart';
import 'package:apppalma/modules/Login/ui/cubit/login_cubit.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/modules/Productos_Agroquimicos/cubit/agroquimicos_cubit.dart';
import 'package:apppalma/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:apppalma/modules/Viajes/ui/peso_extractora/cubit/peso_extractora_cubit.dart';
import 'package:apppalma/modules/Viajes/ui/primera_pagina/cubit/viajes_pendientes_cubit.dart';
import 'package:apppalma/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/Viajes/cubit/viaje_cubit.dart';

class AppPalma extends StatelessWidget {
  const AppPalma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authenticationRepository = AuthenticationRepository();
    // final userRepository = UserRepository();
    return MultiBlocProvider(
        providers: [
          // BlocProvider<UserBloc>(create: (context) => UserBloc()),
          BlocProvider<AuthenticationBloc>(
              create: (context) =>
                  AuthenticationBloc()..add(const AuthenticationChange())),
          BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
          BlocProvider<LoteslistCubit>(create: (context) => LoteslistCubit()),
          BlocProvider<LoteDetailCubit>(create: (context) => LoteDetailCubit()),
          BlocProvider<CensosCubit>(create: (context) => CensosCubit()),
          BlocProvider<PalmaCubit>(create: (context) => PalmaCubit()),
          BlocProvider<EnfermedadCubit>(create: (context) => EnfermedadCubit()),
          BlocProvider<AgroquimicosCubit>(
              create: (context) => AgroquimicosCubit()),
          BlocProvider<PlagasCubit>(create: (context) => PlagasCubit()),
          BlocProvider<CosechaCubit>(create: (context) => CosechaCubit()),
          BlocProvider<PlateosCubit>(create: (context) => PlateosCubit()),
          BlocProvider<FumigacionCubit>(create: (context) => FumigacionCubit()),
          BlocProvider<PodasCubit>(create: (context) => PodasCubit()),
          BlocProvider<TratamientoCubit>(
              create: (context) => TratamientoCubit()),
          BlocProvider<ViajeCubit>(create: (context) => ViajeCubit()),
          BlocProvider<ViajesPendientesCubit>(
              create: (context) => ViajesPendientesCubit()),
          BlocProvider<PesoExtractoraCubit>(
              create: (context) => PesoExtractoraCubit()),
        ],
        child: const MaterialApp(
          title: 'Smart Spotter',
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          localizationsDelegates: [GlobalMaterialLocalizations.delegate],
          supportedLocales: [Locale('en')],
          onGenerateRoute: Routes.generateRoutes,
        ));
  }
}
