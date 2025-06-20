import 'package:sharecars/core/service/hive_services.dart';
import 'package:sharecars/features/auth/data/model/user_model.dart';

String? mytoken() {
  UserModel? user = HiveBoxes.authBox.get(HiveKeys.user);
  final String? token = user?.token;
  return token;
}
