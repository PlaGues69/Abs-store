import 'package:abs_onlinestore/app/constant/hive_table.dart';
import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  UserHiveModel({required this.id, required this.name, required this.email});
}
