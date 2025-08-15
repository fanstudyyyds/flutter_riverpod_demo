import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/page/home/providers/home_provider.dart';
import 'package:untitled3/page/index/view/index_page.dart';
import 'package:untitled3/page/list/view/list_page.dart';
import 'package:untitled3/page/my/view/my_page.dart';
import 'package:untitled3/routers/app_pages.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final clickCount = ref.watch(clickCountProvider);
    final homeIndex = ref.watch(homeIndexProvider);
    final homeEvents = ref.watch(homeEventProvider);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('首页')),
          body: IndexedStack(
            index: homeIndex,
            children: [IndexPage(), ListPage(), MyPage()],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: homeIndex,
              // 设置默认选中项的下标
              onTap: (val) => homeEvents.handleBottomNavTap(ref, val),
              // 点击事件回调函数
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '首页',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '搜索',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '个人中心',
                )
              ])),
    );
  }
}
