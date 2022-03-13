import 'package:apppalma/components/theme.dart';
import 'package:apppalma/modules/Login/ui/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameField extends StatefulWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
            keyboardType: TextInputType.text,
            onChanged: (value) {
              BlocProvider.of<LoginCubit>(context).nameChanged(value);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              errorText:
                  state.name.invalid ? 'Por favor ingrese un usuario' : null,
              hintText: 'Usuario',
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
            ));
      },
    );
  }
}
