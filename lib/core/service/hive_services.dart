
import 'package:hive_flutter/adapters.dart';
import 'package:sharecars/features/auth/data/model/user_model.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());
    // إذا أضفت مثلاً ProfileModel لاحقًا:
    // Hive.registerAdapter(ProfileModelAdapter());

    // Open needed boxes
    await Future.wait([
      Hive.openBox(HiveBoxes.authBoxName),
      Hive.openBox(HiveBoxes.profileBoxName),
    ]);
  }

  static Future<Box<E>> openBox<E>(String boxName) async {
    return await Hive.openBox<E>(boxName);
  }

  static Future<void> closeBox(String boxName) async {
    await Hive.box(boxName).close();
  }

  static Future<void> clearBox(String boxName) async {
    await Hive.box(boxName).clear();
  }

  static Future<void> deleteBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }
}


class HiveKeys {
  static const String user = "user";
}

class HiveBoxes { 
  // صندوق بيانات تسجيل الدخول (مثل UserModel, token)
  static const String authBoxName = 'authBox';
  static Box get authBox => Hive.box(authBoxName);

  // صندوق بيانات الملف الشخصي (مثل صورة، معلومات إضافية)
  static const String profileBoxName = 'profileBox';
  static Box get profileBox => Hive.box(profileBoxName);
}
