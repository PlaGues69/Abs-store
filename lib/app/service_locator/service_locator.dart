import 'package:get_it/get_it.dart';
import 'package:abs_onlinestore/features/auth/data/service/user_local_service.dart';
import 'package:abs_onlinestore/features/auth/data/service/auth_service.dart';

final sl = GetIt.instance;

void setupLocator() {
  // Local storage service
  sl.registerLazySingleton<UserLocalService>(() => UserLocalService());

  // ✅ API Auth service
  sl.registerLazySingleton<AuthService>(() => AuthService());
}
