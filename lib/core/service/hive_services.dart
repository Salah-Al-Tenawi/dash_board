import 'package:hive_flutter/adapters.dart';


class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter(); 
  
 
 await Future.wait([
    Hive.openBox(HiveBoxes.authBoxName),

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
 
  static const String authBoxName = 'authBox';
  static Box get authBox => Hive.box(authBoxName);


}
