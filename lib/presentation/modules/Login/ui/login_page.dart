import 'package:apppalma/presentation/components/main_button_square.dart';
import 'package:apppalma/presentation/components/theme.dart';
import 'package:apppalma/presentation/modules/Login/ui/components/name_field.dart';
import 'package:apppalma/presentation/modules/Login/ui/components/password_field.dart';
import 'package:apppalma/presentation/modules/Login/ui/cubit/login_cubit.dart';
import 'package:apppalma/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingTop = SizeConfig.paddingTop;
    return Scaffold(
      backgroundColor: AppPalmaColors.grey,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Iniciando sesión'),
                      CircularProgressIndicator()
                    ],
                  ),
                ),
              );
          }
          if (state.status == FormzStatus.submissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Error al iniciar sesión'),
                ),
              );
          }
          if (state.status == FormzStatus.submissionSuccess) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/finca', (_) => false);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      scale: 1,
                      image: AssetImage("assets/images/palma-logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const NameField(),
                const SizedBox(
                  height: 10,
                ),
                const PasswordField(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return MainButtonSquare(
                          text: 'Login',
                          press: () {
                            if (state.status == FormzStatus.valid ||
                                state.status == FormzStatus.submissionFailure) {
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
      ),
    );
  }
}
