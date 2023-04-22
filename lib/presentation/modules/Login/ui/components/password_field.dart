import 'package:apppalma/presentation/components/theme.dart';
import 'package:apppalma/presentation/modules/Login/ui/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHideenPassword = true;
  void _togglePasswordView() {
    setState(() {
      _isHideenPassword = !_isHideenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Material(
          elevation: 2.0,
          shadowColor: Colors.grey,
          child: TextField(
            obscureText: _isHideenPassword,
            onChanged: (value) {
              BlocProvider.of<LoginCubit>(context).passwordChanged(value);
            },
            decoration: InputDecoration(
              // errorText: state.password.invalid ? 'Contraseña muy corta' : null,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Ingrese su contraseña',
              hintStyle: const TextStyle(fontSize: 16),
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppPalmaColors.error),
              ),
              suffixIcon: InkWell(
                onTap: _togglePasswordView,
                child: _isHideenPassword
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: AppPalmaColors.darkgrey,
                      )
                    : const Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppPalmaColors.blue,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
