import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'main.dart';

void main() {
  testWidgets('MyApp has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Избранные автомобили'), findsOneWidget);
  });
}
