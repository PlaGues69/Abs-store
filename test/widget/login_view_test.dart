import 'package:abs_onlinestore/features/auth/data/service/auth_service.dart';
import 'package:abs_onlinestore/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Override login method for testing
  setUp(() {
    AuthService.setLoginOverride((email, password) async {
      if (email == 'test@example.com' && password == '123456') {
        return {'token': 'test-token'};
      } else {
        throw Exception('Invalid credentials');
      }
    });
  });

  tearDown(() {
    AuthService.setLoginOverride(null);
  });

  testWidgets('LoginView renders with input fields and button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SignInView()));

    // Find email and password fields
    expect(find.byType(TextField), findsNWidgets(2));

    // Find login button
    expect(find.widgetWithText(ElevatedButton, 'LOGIN'), findsOneWidget);
  });

  testWidgets('User can type email and password and press login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SignInView()));

    // Fill in the text fields
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), '123456');

    // Tap the login button
    await tester.tap(find.widgetWithText(ElevatedButton, 'LOGIN'));

    // Pump until animation and state update complete
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    // Should be done loading
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('Shows error SnackBar on failed login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SignInView()));

    // Fill with wrong credentials
    await tester.enterText(find.byType(TextField).at(0), 'wrong@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'wrongpass');

    // Tap login button
    await tester.tap(find.widgetWithText(ElevatedButton, 'LOGIN'));
    await tester.pumpAndSettle();

    // ✅ Expect SnackBar with error
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.textContaining('Invalid credentials'), findsOneWidget);
  });
}
