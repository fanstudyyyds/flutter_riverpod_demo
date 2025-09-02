import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class HiveConfig {
  static Box? _myBox;
  static Map DB = Map<String, Box>();

  static Future<void> installHive() async {
    /// 初始化数据库地址
    /// 使用path_provider必须使用WidgetsFlutterBinding.ensureInitialized
    ///
    WidgetsFlutterBinding.ensureInitialized();
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);

    await getInstanceHive();
  }

  static Future<void> getInstanceHive() async {
    _myBox ??= await Hive.openBox(HiveKey.MYBOX);
    DB[HiveKey.MYBOX] = _myBox;
  }

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    String path = document.path;
    _myBox = await Hive.openBox(HiveKey.MYBOX);
    print("[HiveConfig]<init> $_myBox 路径： $path");
  }

  /// 根据key获取不同的Hive Box
  static Box getInstance(String key) {
    if (DB.containsKey(key)) {
      return DB[HiveKey.MYBOX];
    }
    return MY_BOX;
  }

  static Box get MY_BOX => _myBox!;
}

class HiveKey {
  static const String MYBOX = "myBox";
}
