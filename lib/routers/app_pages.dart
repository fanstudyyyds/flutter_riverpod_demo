import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/page/home/view/home_page.dart';
import 'package:untitled3/page/index/view/index_page.dart';
import 'package:untitled3/page/list/view/list_page.dart';
import 'package:untitled3/page/my/view/my_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INDEX;

  static final routes = {
    Routes.INDEX: (context) => Consumer(
          builder: (context, ref, child) {
            return const IndexPage();
          },
        ),
    Routes.LIST: (context) => Consumer(
          builder: (context, ref, child) {
            return const HomePage();
          },
        ),
    Routes.MY: (context) => Consumer(
          builder: (context, ref, child) {
            return const HomePage();
          },
        )
  };
}
