import 'package:sharecars/core/service/hive_services.dart';
import 'package:sharecars/features/auth/data/model/admin_model.dart';


abstract class AuthLocalDataSource {

  String? featchToken();
  Future clearUser();
}

class AuthLocalDataSourceIm extends AuthLocalDataSource {


  @override
  String? featchToken() {
    final user = HiveBoxes.authBox.get(HiveKeys.user) as AdminModel?;
    return user?.sessionId;
  }

  

  @override
  Future clearUser() async {
    await HiveBoxes.authBox.delete(HiveKeys.user);
  }
}
