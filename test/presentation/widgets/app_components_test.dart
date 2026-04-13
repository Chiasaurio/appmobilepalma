import 'package:apppalma/presentation/components/main_button.dart';
import 'package:apppalma/presentation/components/main_button_square.dart';
import 'package:apppalma/presentation/components/secondary_button.dart';
import 'package:apppalma/presentation/components/widgets/logo_sigpa.dart';
import 'package:apppalma/utils/confirmacion_alerta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Route<dynamic> _placeholderRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (_) => Scaffold(
      body: Text(settings.name ?? 'root'),
    ),
  );
}

Widget _wrappedApp(Widget child) {
  return MaterialApp(
    onGenerateRoute: _placeholderRoute,
    home: child,
  );
}

void main() {
  testWidgets('buttons and logo render and respond to taps', (tester) async {
    var mainPressed = 0;
    var secondaryPressed = 0;
    var squarePressed = 0;

    await tester.pumpWidget(
      _wrappedApp(
        Material(
          child: Column(
            children: [
              MainButton(
                text: 'Primary',
                press: () => mainPressed++,
              ),
              SecondaryButton(
                text: 'Secondary',
                press: () => secondaryPressed++,
              ),
              MainButtonSquare(
                text: 'Square',
                press: () => squarePressed++,
              ),
              const LogoSigpa(),
            ],
          ),
        ),
      ),
    );

    expect(find.text('SIGPA'), findsOneWidget);
    await tester.tap(find.text('Primary'));
    await tester.tap(find.text('Secondary'));
    await tester.tap(find.text('Square'));
    await tester.pump();

    expect(mainPressed, 1);
    expect(secondaryPressed, 1);
    expect(squarePressed, 1);
  });

  testWidgets('confirmation dialog can be accepted or cancelled',
      (tester) async {
    var confirmed = 0;

    await tester.pumpWidget(
      _wrappedApp(
        Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ConfirmacionAlerta('Seguro?')
                    .confirmacionAlerta(context, () => confirmed++);
              },
              child: const Text('Open alert'),
            );
          },
        ),
      ),
    );

    await tester.tap(
      find.widgetWithText(ElevatedButton, 'Open alert'),
      warnIfMissed: false,
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Seguro?'), findsOneWidget);
    await tester.tap(
      find.widgetWithText(TextButton, 'Ok'),
      warnIfMissed: false,
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(confirmed, 1);

    await tester.pumpWidget(
      _wrappedApp(
        Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ConfirmacionAlerta('Seguro?')
                    .confirmacionAlerta(context, () => confirmed++);
              },
              child: const Text('Open alert'),
            );
          },
        ),
      ),
    );

    await tester.tap(
      find.widgetWithText(ElevatedButton, 'Open alert'),
      warnIfMissed: false,
    );
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(
      find.widgetWithText(TextButton, 'Cancelar'),
      warnIfMissed: false,
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(confirmed, 1);
  });
}
