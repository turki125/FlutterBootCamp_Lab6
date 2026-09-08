import 'package:day12_introduction_to_databsae/screens/login_screen.dart';
import 'package:day12_introduction_to_databsae/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Empty credentials show validation and do not open Home', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text('Enter your email and password.'), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);
  });

  testWidgets('Email alone cannot log in and password is hidden', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.enterText(find.byType(TextField).first, 'student@example.com');
    expect(
      tester.widget<TextField>(find.byType(TextField).last).obscureText,
      isTrue,
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text('Enter your email and password.'), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);
  });

  testWidgets('Home counter increments when pressed', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.text('Add one'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
