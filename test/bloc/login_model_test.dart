import 'package:abs_onlinestore/features/auth/presentation/view_model/login_view_model/login_model.dart';
import 'package:abs_onlinestore/features/auth/data/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Signinmodel login process', () {
    late Signinmodel model;

    setUp(() {
      // Override AuthService login during test
      AuthService.setLoginOverride((email, password) async {
        return {"token": "dummy_token"};
      });
      model = Signinmodel();
    });

    test('should update loading and loginSuccess on success', () async {
      final future = model.login('test@example.com', '123456');

      expect(model.isLoading, true); // loading should be true initially

      await future;

      expect(model.isLoading, false);
      expect(model.loginSuccess, true);
      expect(model.error, isNull);
    });
    test('should set error on failed login', () async {
      AuthService.setLoginOverride((email, password) async {
        throw Exception("Login failed");
      });

      model = Signinmodel();
      await model.login('wrong@email.com', 'wrongpassword');

      expect(model.isLoading, false);
      expect(model.loginSuccess, false);
      expect(model.error, contains('Login failed'));
    });
  });
}
