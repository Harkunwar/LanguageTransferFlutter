import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:language_transfer/src/ui/screens/login.dart';
import 'package:language_transfer/src/ui/screens/signup.dart';

void main() {
  testWidgets('login page test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    await tester.pumpAndSettle();
    await expectLater(find.byType(LoginScreen),
        matchesGoldenFile('Login.png'));
  });

  testWidgets('SignUp page test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SignupScreen()));
    await tester.pumpAndSettle();
    await expectLater(find.byType(SignupScreen),
        matchesGoldenFile('Signup.png'));
  });
}
