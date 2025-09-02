import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:untitled3/hive/hive_config.dart';
import 'package:untitled3/page/home/view/home_page.dart';

final clickCountProvider = StateProvider<int>((ref) => 0);

void main() {
  HiveConfig.installHive();
  runApp(const ProviderScope(
    child: HomePage(),
  ));
}
