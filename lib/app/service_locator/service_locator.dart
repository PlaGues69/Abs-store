import 'package:get_it/get_it.dart';
import 'package:abs_onlinestore/features/auth/data/service/user_local_service.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<UserLocalService>(() => UserLocalService());
}
