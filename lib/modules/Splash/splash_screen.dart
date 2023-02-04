import 'package:apppalma/components/theme.dart';
import 'package:apppalma/modules/Login/bloc/authentication_bloc.dart';
import 'package:apppalma/modules/Login/resources/authentication_repository.dart';
import 'package:apppalma/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: AppPalmaColors.grey,
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) async {
            if (state.status == AuthenticationStatus.authenticated) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/finca', (_) => false);
            } else {
              Navigator.of(context).pushNamed(
                '/auth-options',
              );
            }
          },
          child: Center(
            child: Container(
              height: 100,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  scale: 0.5,
                  image: AssetImage("assets/images/simon.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ));
  }
}
