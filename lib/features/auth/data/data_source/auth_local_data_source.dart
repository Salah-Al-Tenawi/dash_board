import 'package:sharecars/features/auth/data/model/user_model.dart';

abstract class AuthLocalDataSource {
  UserModel featchUser();
  String featchToken();
}

class AuthLocalDataSourceIm extends AuthLocalDataSource {
  @override
  UserModel featchUser() {
    // TODO: implement featchUser
    throw UnimplementedError();
  }
  
  @override
  String featchToken() {
    // TODO: implement featchToken
    throw UnimplementedError();
  }
}
