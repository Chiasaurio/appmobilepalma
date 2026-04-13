import 'package:apppalma/presentation/modules/Login/ui/cubit/login_cubit.dart';
import 'package:apppalma/presentation/modules/Login/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

Route<dynamic> _placeholderRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (_) => Scaffold(
      body: Text(settings.name ?? 'root'),
    ),
  );
}

void main() {
  testWidgets('login page renders and ignores invalid submissions',
      (tester) async {
    final loginCubit = LoginCubit();

    await tester.pumpWidget(
      MaterialApp(
        onGenerateRoute: _placeholderRoute,
        home: BlocProvider<LoginCubit>.value(
          value: loginCubit,
          child: const LoginPage(),
        ),
      ),
    );

    expect(find.textContaining('Inicia sesi'), findsOneWidget);

    await tester.enterText(
      find.byType(TextFormField).first,
      'https://example.com',
    );
    await tester.tap(find.widgetWithText(TextButton, 'Login'));
    await tester.pump();
  });
}
