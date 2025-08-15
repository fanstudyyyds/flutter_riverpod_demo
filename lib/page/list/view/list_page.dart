import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/page/home/providers/home_provider.dart';
import 'package:epub_view/epub_view.dart';


class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final clickCount = ref.watch(clickCountProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){

            },
            child: const Text('加载 Assets 中的 EPUB'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){

            },
            child: const Text('加载设备中的 EPUB'),
          ),
        ],
      ),
    );
  }
}
