import 'package:apppalma/components/main_button.dart';
import 'package:apppalma/components/theme.dart';
import 'package:apppalma/modules/Login/ui/components/name_field.dart';
import 'package:apppalma/modules/Login/ui/components/password_field.dart';
import 'package:apppalma/modules/Login/ui/cubit/login_cubit.dart';
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
          },
          child: Padding(
            padding: EdgeInsets.only(top: paddingTop + 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                NameField(),
                SizedBox(
                  height: 10,
                ),
                PasswordField(),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return MainButton(
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
