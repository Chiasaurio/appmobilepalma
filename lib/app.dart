import 'package:apppalma/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

class AppPalma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final authenticationRepository = AuthenticationRepository();
    // final userRepository = UserRepository();
    return MultiBlocProvider(
        providers: [
          // BlocProvider<UserBloc>(create: (context) => UserBloc()),
          // BlocProvider<AuthenticationBloc>(
          //     create: (context) =>
          //         AuthenticationBloc(BlocProvider.of<UserBloc>(context))
          //           ..add(AuthenticationChange())),
          BlocProvider<LoteslistCubit>(create: (context) => LoteslistCubit()),
          BlocProvider<LoteDetailCubit>(create: (context) => LoteDetailCubit()),
          BlocProvider<CensosCubit>(create: (context) => CensosCubit()),
          BlocProvider<PalmaCubit>(create: (context) => PalmaCubit()),
          BlocProvider<EnfermedadCubit>(create: (context) => EnfermedadCubit()),
          BlocProvider<CosechaCubit>(create: (context) => CosechaCubit()),
          BlocProvider<PlateosCubit>(create: (context) => PlateosCubit()),
          BlocProvider<PodasCubit>(create: (context) => PodasCubit()),
        ],
        child: const MaterialApp(
          title: 'Smart Spotter',
          debugShowCheckedModeBanner: false,
          initialRoute: '/finca',
          localizationsDelegates: [GlobalMaterialLocalizations.delegate],
          supportedLocales: [Locale('en')],
          onGenerateRoute: Routes.generateRoutes,
        ));
  }
}
