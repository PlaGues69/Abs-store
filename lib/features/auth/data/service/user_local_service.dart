import 'package:abs_onlinestore/app/constant/hive_table.dart';
import 'package:abs_onlinestore/features/auth/data/model/user_hive_model.dart';
import 'package:hive/hive.dart';

class UserLocalService {
  final Box<UserHiveModel> _box = Hive.box<UserHiveModel>(
    HiveTableConstant.userBox,
  );

  Future<void> saveUser(UserHiveModel user) async {
    await _box.put('user_key', user);
  }

  UserHiveModel? getUser() {
    return _box.get('user_key');
  }

  Future<void> clearUser() async {
    await _box.delete('user_key');
  }

  bool isLoggedIn() {
    return _box.containsKey('user_key');
  }
}
