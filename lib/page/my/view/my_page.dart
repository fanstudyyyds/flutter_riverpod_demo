import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/page/home/providers/home_provider.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final clickCount = ref.watch(clickCountProvider);

    return Center(
        child: Column(
      children: [Text("My: $clickCount")],
    ));
  }
}
