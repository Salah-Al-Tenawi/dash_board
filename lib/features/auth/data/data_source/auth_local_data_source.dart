import 'package:sharecars/core/service/hive_services.dart';
import 'package:sharecars/features/auth/data/model/user_model.dart';

abstract class AuthLocalDataSource {
  UserModel? featchUser();
  String? featchToken();
  void saveUser(UserModel user);
  Future clearUser();
}

class AuthLocalDataSourceIm extends AuthLocalDataSource {
  @override
  UserModel? featchUser() {
    final user = HiveBoxes.authBox.get(HiveKeys.user) as UserModel?;
    return user;
  }

  @override
  String? featchToken() {
    final user = HiveBoxes.authBox.get(HiveKeys.user) as UserModel?;
    return user?.token;
  }

  @override
  void saveUser(UserModel user) {
    HiveBoxes.authBox.put(HiveKeys.user, user);
  }

  @override
  Future clearUser() async {
    await HiveBoxes.authBox.delete(HiveKeys.user);
  }
}
