import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/hive/hive_config.dart';
import 'package:untitled3/page/index/modes/Index_mode.dart';
import 'package:untitled3/page/index/providers/index_providers.dart';
import 'package:untitled3/page/index/api/index_api.dart';

class IndexPage extends ConsumerWidget {
  const IndexPage({super.key});

  @override
  Widget build_(BuildContext context, WidgetRef ref) {
    //
    final homeIndex = ref.watch(homeIndexProvider);
    final indexMode = ref.watch(indexModeProvider);
    HiveConfig.MY_BOX.put("key", "value");

    return SingleChildScrollView(
        child: Column(
      // children: indexMode.map((item) => _buildImageCard(item, ref)).toList(),
      // children: indexMode.items.map((item) => _buildImageCard(item, ref)).toList(),
      children: indexMode?.items?.isNotEmpty ?? false
          ? indexMode.items.map((item) => _buildImageCard(item, ref)).toList()
          : [
              const Center(
                child: Text('暂无数据'),
              )
            ],
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final homeIndex = ref.watch(homeIndexProvider);
    final indexMode = ref.watch(indexModeProvider);

    return SingleChildScrollView(
        child: Column(
            // children: indexMode.map((item) => _buildImageCard(item, ref)).toList(),
            // children: indexMode.items.map((item) => _buildImageCard(item, ref)).toList(),
            children: [
          if (indexMode.items?.isNotEmpty ?? false)
            ...indexMode.items
                .map((item) => _buildImageCard(item, ref))
                .toList()
          else
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 400),
                  Icon(Icons.inbox, size: 64, color: Colors.grey[300]),
                  SizedBox(height: 50),
                  Text(
                    "没有找到内容",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () => ref.refresh(indexModeProvider), // 重新加载
                    child: Text("重新加载"),
                  )
                ],
              ),
            )
        ]));
  }

  // 图文卡片
  Widget _buildImageCard(IndexMode mode, WidgetRef ref) {
    final indexAsync = ref.watch(userApiProvider);

    return InkWell(
      onTap: () async {
        final res = await indexAsync.getUser(1);
        // ref.read(indexModeProvider.notifier).state.add(res);
        // ref.read(indexModeProvider.notifier).update((state) => [...state, res]);
        ref.read(indexModeProvider.notifier).addItem(res);
        // print(ref.read(indexModeProvider.notifier).state.length);
        print(ref.read(indexModeProvider.notifier).size());
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  mode.url.toString(),
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                    ),
                  ),
                  child: const Text(
                    '自然风光',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '山脉景观',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '壮丽的山脉景观，展示了大自然的宏伟与美丽。山脉在日出和日落时分的色彩变化尤为迷人。',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 16, color: Colors.blue.shade700),
                          const SizedBox(width: 4),
                          const Text('西藏自治区'),
                        ],
                      ),
                      const Text('2023年10月15日',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
