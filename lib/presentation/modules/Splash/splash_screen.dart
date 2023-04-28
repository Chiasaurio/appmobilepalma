import 'package:apppalma/presentation/components/theme.dart';
import 'package:apppalma/presentation/modules/Login/cubit/authentication_cubit.dart';
import 'package:apppalma/presentation/modules/Login/resources/authentication_repository.dart';
import 'package:apppalma/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<AuthenticationCubit>(context)
        .mapAuthenticationOnLoadingToState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: AppPalmaColors.grey,
        body: BlocListener<AuthenticationCubit, AuthenticationState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) async {
            if (state.status == AuthenticationStatus.authenticated) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/finca', (_) => false);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/auth-options', (_) => false);
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
