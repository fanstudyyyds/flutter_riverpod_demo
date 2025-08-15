import 'package:flutter_riverpod/flutter_riverpod.dart';

final clickCountProvider = StateProvider<int>((ref) => 0);

final homeIndexProvider = StateProvider<int>((ref) => 0);

/// 提供首页事件处理实例
final homeEventProvider = Provider<HomeEvents>((ref) {
  return HomeEvents();
});

/// 处理首页事件
class HomeEvents {
  /// 处理底部导航栏点击
  void handleBottomNavTap(WidgetRef ref, int index) {
    // 这里可以根据不同的索引执行不同的操作
    switch (index) {
      case 0:
        print('首页按钮被点击');
        ref.read(homeIndexProvider.notifier).state = 0;
        break;
      case 1:
        print('搜索按钮被点击');
        ref.read(homeIndexProvider.notifier).state = 1;
        break;
      case 2:
        print('个人中心按钮被点击');
        ref.read(homeIndexProvider.notifier).state = 2;
        break;
    }
  }
}
