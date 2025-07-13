import 'package:abs_onlinestore/features/auth/presentation/view_model/login_view_model/login_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:abs_onlinestore/features/auth/data/service/auth_service.dart';

void main() {
  group('Signinmodel', () {
    late Signinmodel model;

    setUp(() {
      AuthService.setLoginOverride((email, password) async {
        if (email == 'fail@test.com') {
          throw Exception('Login failed');
        }
        return {'token': 'test-token'};
      });

      model = Signinmodel();
    });

    test('login success updates loginSuccess', () async {
      await model.login('test@test.com', '123456');
      expect(model.loginSuccess, true);
      expect(model.error, isNull);
    });

    test('login failure sets error', () async {
      await model.login('fail@test.com', 'wrong');
      expect(model.loginSuccess, false);
      expect(model.error, contains('Login failed'));
    });
  });
}
  