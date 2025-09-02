import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class HiveConfig {
  static Box? _myBox;

  static Future<void> install() async {
    /// 初始化数据库地址
    /// 使用path_provider必须使用WidgetsFlutterBinding.ensureInitialized
    ///
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);

    getInstance();
  }

  static void getInstance() async {
    _myBox ??= await Hive.openBox('myBox');
  }

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    String path = document.path;
    _myBox = await Hive.openBox('myBox');
    print("[HiveConfig]<init> $_myBox 路径： $path");
  }

  static Box get MY_BOX => _myBox!;
}
