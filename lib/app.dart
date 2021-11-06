import 'package:apppalma/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
