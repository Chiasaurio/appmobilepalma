import 'package:apppalma/env.dart';
import 'package:apppalma/presentation/components/main_button_square.dart';
import 'package:apppalma/presentation/components/theme.dart';
import 'package:apppalma/presentation/components/widgets/logo_sigpa.dart';
import 'package:apppalma/presentation/modules/Login/ui/components/name_field.dart';
import 'package:apppalma/presentation/modules/Login/ui/components/password_field.dart';
import 'package:apppalma/presentation/modules/Login/ui/cubit/login_cubit.dart';
import 'package:apppalma/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingTop = SizeConfig.paddingTop;
    return Scaffold(
      backgroundColor: AppPalmaColors.grey,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.inProgress) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Iniciando sesión'),
                      CircularProgressIndicator()
                    ],
                  ),
                ),
              );
          }
          if (state.status == FormzSubmissionStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Error al iniciar sesión'),
                ),
              );
          }
          if (state.status == FormzSubmissionStatus.success) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/finca', (_) => false);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 50, left: 20, right: 20),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoSigpa(),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Remote',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                onChanged: (value) {
                  BaseApi.baseUrl = value;
                },
              ),
              Text('Inicia sesión',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              const NameField(),
              const PasswordField(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return MainButtonSquare(
                        text: 'Login',
                        press: () {
                          if (state.status == FormzSubmissionStatus.initial ||
                              state.status == FormzSubmissionStatus.failure) {
                            BlocProvider.of<LoginCubit>(context)
                                .signUpFormSubmitted();
                          }
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
