import 'package:apppalma/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppPalma boots without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const AppPalma());
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
