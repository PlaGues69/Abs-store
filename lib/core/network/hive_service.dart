import 'package:abs_onlinestore/app/constant/hive_table.dart';
import 'package:abs_onlinestore/features/auth/data/model/user_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserHiveModelAdapter());
    await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
  }
}
